//
//  iOSTestTalkKIFTests.m
//  iOSTestTalkKIFTests
//
//  Created by Joris Dubois on 02/12/15.
//  Copyright © 2015 Joris Dubois. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF.h>

@interface iOSTestTalkKIFTests : XCTestCase {
	UIView *_hotOrNotIndicatorView;
	UILabel *_nameLabel;
}

@end

@implementation iOSTestTalkKIFTests

- (void)setUp {
	[super setUp];
	_hotOrNotIndicatorView = [tester waitForViewWithAccessibilityLabel:@"hotOrNotIndicatorView"];
	_nameLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"nameLabel"];
}

- (void)testTappingOnHotButtonDoesSetHotOrNotIndicatorViewColorToExpectedColor {
	[tester tapViewWithAccessibilityLabel:@"notButton"];
	XCTAssertEqualObjects(_hotOrNotIndicatorView.backgroundColor, [UIColor blueColor]);
}

- (void)testTappingOnNotButtonDoesSetHotOrNotIndicatorViewColorToExpectedColor {
	[tester tapViewWithAccessibilityLabel:@"hotButton"];
	XCTAssertEqualObjects(_hotOrNotIndicatorView.backgroundColor, [UIColor redColor]);
}

- (void)testSwipeTwoTimesToLeftDoesShowExpectedPerson {
	[tester swipeViewWithAccessibilityLabel:@"hotOrNotViewControllerView" inDirection:KIFSwipeDirectionLeft];
	[tester swipeViewWithAccessibilityLabel:@"hotOrNotViewControllerView" inDirection:KIFSwipeDirectionLeft];
	XCTAssertEqualObjects(_nameLabel.text, @"Megan Fox");
}

@end