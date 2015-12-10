//
//  DefaultPersonDataProviderTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 03/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DefaultPersonDataProvider.h"
#import "PersonObject.h"

@interface DefaultPersonDataProviderTest : XCTestCase {
	DefaultPersonDataProvider *_dataProvider;
	NSArray *_persons;
}
@end

@implementation DefaultPersonDataProviderTest

- (void)setUp {
	[super setUp];
	_persons = @[[[PersonObject alloc] init], [[PersonObject alloc] init], [[PersonObject alloc] init]];
	_dataProvider = [[DefaultPersonDataProvider alloc] initWithData:_persons];
}

- (void)testCurrentSelectedPersonIsFirstPersonOnInitialisation {
	XCTAssertEqualObjects(_dataProvider.currentSelectedPerson, _persons[0]);
}

- (void)testCurrentSelectedPersonIsFirstPersonWhenOutOfBoundsLeft {
	[_dataProvider switchToPrevious];
	XCTAssertEqualObjects(_dataProvider.currentSelectedPerson, _persons[0]);
}

- (void)testCurrentSelectedPersonIsLastPersonWhenOutOfBoundsRight {
	[_dataProvider switchToNext];
	[_dataProvider switchToNext];
	[_dataProvider switchToNext];
	XCTAssertEqualObjects(_dataProvider.currentSelectedPerson, _persons[2]);
}

- (void)testCurrentSelectedPersonIsSecondPersonWhenSwitchToNext {
	[_dataProvider switchToNext];
	XCTAssertEqualObjects(_dataProvider.currentSelectedPerson, _persons[1]);
}

- (void)testCurrentSelectedPersonIsSecondPersonWhenSwitchToNextAndSwitchToPrevious {
	[_dataProvider switchToNext];
	[_dataProvider switchToPrevious];
	XCTAssertEqualObjects(_dataProvider.currentSelectedPerson, _persons[0]);
}

@end