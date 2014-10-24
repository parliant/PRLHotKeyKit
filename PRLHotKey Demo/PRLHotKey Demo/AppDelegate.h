//
//  AppDelegate.h
//  PRLHotKey
//
//  Created by Parliant on 2014-10-20.
//  Copyright (c) 2014 Parliant. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

OSStatus MyHotKeyHandler(EventHandlerCallRef nextHandler,EventRef theEvent, void *userData);

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
	EventHotKeyRef activateHotKeyRef;
}

@end

