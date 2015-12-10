//
//  HotOrNotViewControllerTests.m
//  HotOrNotViewControllerTests
//
//  Created by Joris Dubois on 22/11/15.
//  Copyright © 2015 Joris Dubois. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HotOrNotViewControllerTests : XCTestCase {
	XCUIElement *_notButton;
	XCUIElement *_hotButton;
	XCUIElement *_hotOrNotViewControllerView;
}
@end

@implementation HotOrNotViewControllerTests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
	XCUIApplication *application = [[XCUIApplication alloc] init];
	[application launch];
	[self _fetchNeededUIComponentsForApplication:application];
}

- (void)_fetchNeededUIComponentsForApplication:(XCUIApplication *)application {
	_notButton = application.buttons[@"notButton"];
	_hotButton = application.buttons[@"hotButton"];
    _hotOrNotViewControllerView = application.otherElements[@"hotOrNotViewControllerView"];
}

- (void)testTappingOnHotAndNotButton {
	[_hotButton tap];
    [_notButton tap];
}

- (void)testSwipingFiveTimesToLeft {
    [_hotOrNotViewControllerView swipeLeft];
    [_hotOrNotViewControllerView swipeLeft];
	[_hotOrNotViewControllerView swipeLeft];
	[_hotOrNotViewControllerView swipeLeft];
	[_hotOrNotViewControllerView swipeLeft];
}

@end
