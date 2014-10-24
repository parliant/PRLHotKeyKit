//
//  PRLHotKeyTests.m
//  PRLHotKeyTests
//
//  Created by Parliant on 2014-10-20.
//  Copyright (c) 2014 Parliant. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "PRLHotKey.h"

@interface PRLHotKeyKitTests : XCTestCase

@end

@implementation PRLHotKeyKitTests

- (void)setUp {
	[super setUp];
	// Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	[super tearDown];
}

- (void)testEmptyHotKey {
	// This is an example of a functional test case.
	XCTAssertNotNil([[PRLHotKey alloc] initWithKeyCode:0 modifiers:0],@"Should have returned empty hotkey.");
}

- (void)testHotKeyForValidString
{
	PRLHotKey *hk = [[PRLHotKey alloc] initWithKeyCode:40 modifiers:(NSShiftKeyMask | NSCommandKeyMask)]; // prime the lookup dictionary
	XCTAssertNotNil(hk,@"This should have made the hotkey: ⌘⇧ K");
	hk = [PRLHotKey hotKeyForString:@"⌘⇧ K"];
	XCTAssertNotNil(hk,@"Did not receive hotkey back for string @\"⌘⇧ K\"");
	XCTAssert(hk.modifiers == (NSShiftKeyMask | NSCommandKeyMask),@"Modifiers were not set correctly.");
	XCTAssert(hk.keyCode == 40,@"Keycode not set correctly."); // 40 is keycode for k
}

- (void)testHotKeyForInvalidString
{
	XCTAssertNil([PRLHotKey hotKeyForString:@"not a key"], @"Should have returned a nil hotkey.");
}

/*
 - (void)testPerformanceExample {
 // This is an example of a performance test case.
 [self measureBlock:^{
 // Put the code you want to measure the time of here.
 }];
 }
 */
@end
