//
//  AppDelegate.m
//  PRLHotKey
//
//  Created by Parliant on 2014-10-20.
//  Copyright (c) 2014 Parliant. All rights reserved.
//

#import "AppDelegate.h"
#import <PRLHotKeyKit/PRLHotKeyKit.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *hotKeyField;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	activateHotKeyRef = nil;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (void)registerActivateHotKey:(PRLHotKey *)hotKey
{
	OSStatus error;

	if (activateHotKeyRef)
	{
		UnregisterEventHotKey(activateHotKeyRef);
		activateHotKeyRef = nil;
	}

	if ((!hotKey) || hotKey.isEmpty)
		return;

	error = [self registerHotKey:hotKey withID:1 hotKeyRef:&activateHotKeyRef];
	if (error == eventHotKeyExistsErr)
	{
		NSLog(@"This hotkey is taken by another app. %@",[hotKey description]);
	}
	if (error != noErr)
	{
		NSLog(@"Error %d registering hotkey: %@",error,[hotKey description]);
	}
}

- (OSStatus)registerHotKey:(PRLHotKey *)hotKey withID:(NSInteger)hotKeyID hotKeyRef:(EventHotKeyRef *)hotKeyRef
{
	EventHotKeyID myHotKeyID;
	EventTypeSpec eventType;
	UInt16	activateKey;
	UInt32	activateModifier = 0;
	UInt16	carbonModifier = 0;

	if (hotKey && hotKeyID)
	{
		if (hotKey.isEmpty)
		{
			//not registering a null hotkey
			hotKeyRef = NULL;
			return eventNotHandledErr;
		}
		activateKey = hotKey.keyCode;
		activateModifier = (UInt32)hotKey.modifiers;
		eventType.eventClass=kEventClassKeyboard;
		eventType.eventKind=kEventHotKeyPressed;
		InstallApplicationEventHandler(&MyHotKeyHandler, 1, &eventType, (__bridge void *)self, NULL);
		myHotKeyID.signature = (OSType)'gvc1';
		myHotKeyID.id = (UInt32)hotKeyID;
		// must translate nsevent modifier to carbon key modifiers
		if (activateModifier & NSShiftKeyMask) carbonModifier += shiftKey;
		if (activateModifier & NSAlternateKeyMask) carbonModifier += optionKey;
		if (activateModifier & NSCommandKeyMask) carbonModifier += cmdKey;
		if (activateModifier & NSControlKeyMask) carbonModifier += controlKey;
		return RegisterEventHotKey(activateKey, carbonModifier, myHotKeyID,GetApplicationEventTarget(), 0, hotKeyRef);
	}
	return eventNotHandledErr;
}

- (IBAction)leftHotKeyField:(id)sender {
	[self registerActivateHotKey:(PRLHotKey *)[self.hotKeyField objectValue]];
}

#pragma mark - Window delegate
- (void)windowWillClose:(NSNotification *)notification
{
	[self registerActivateHotKey:(PRLHotKey *)[self.hotKeyField objectValue]];
}
@end

#pragma mark - HotKey handling

OSStatus MyHotKeyHandler(EventHandlerCallRef nextHandler,EventRef theEvent, void *userData)
{
	AppDelegate *appDelegate = (__bridge AppDelegate *)(userData);
	EventHotKeyID hotKeyID;

	GetEventParameter(theEvent,kEventParamDirectObject,typeEventHotKeyID,
					  NULL,sizeof(hotKeyID),NULL,&hotKeyID);

	NSLog(@"HotKey with ID %u Pressed.",(unsigned int)hotKeyID.id);

	__block UInt32 myHotKeyID = hotKeyID.id;
	if (myHotKeyID == 1) // send to all
	{
		[[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
		[appDelegate.window makeKeyAndOrderFront:nil];
	}
	return noErr;
}
