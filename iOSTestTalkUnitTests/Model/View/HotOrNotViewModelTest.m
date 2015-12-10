//
//  HotOrNotViewModelTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 03/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PersonView.h"
#import "PersonObject.h"
#import "HotOrNotViewModel.h"
#import "PersonDataProviderMock.h"
#import "ViewPopulatorMock.h"

@interface HotOrNotViewModelTest : XCTestCase {
	PersonDataProviderMock *_dataProvider;
	ViewPopulatorMock *_viewPopulator;
	HotOrNotViewModel *_viewModel;
}

@end

@implementation HotOrNotViewModelTest

- (void)setUp {
	[super setUp];
	_dataProvider = [[PersonDataProviderMock alloc] init];
	_viewPopulator = [[ViewPopulatorMock alloc] init];
	_viewModel = [[HotOrNotViewModel alloc] initWithPersonViewPopulator:_viewPopulator personDataProvider:_dataProvider];
}

- (void)testPopulatePersonViewDoesInvokeViewPopulatorWithCurrentSelectedPersonFromDataProviderWithExpectedView {
	PersonView *personView = [[PersonView alloc] init];
	PersonObject *personObject = [[PersonObject alloc] init];
	_dataProvider.currentSelectedPerson = personObject;
	[_viewModel populatePersonView:personView];
	XCTAssertEqualObjects(_viewPopulator.capturedView, personView);
}

- (void)testPopulatePersonViewDoesInvokeViewPopulatorWithCurrentSelectedPersonFromDataProviderWithExpectedData {
	PersonView *personView = [[PersonView alloc] init];
	PersonObject *personObject = [[PersonObject alloc] init];
	_dataProvider.currentSelectedPerson = personObject;
	[_viewModel populatePersonView:personView];
	XCTAssertEqualObjects(_viewPopulator.capturedData, personObject);
}

- (void)testDidPressHotDoesSetCurrentPersonStatusToHot {
	PersonObject *personObject = [[PersonObject alloc] init];
	_dataProvider.currentSelectedPerson = personObject;
	[_viewModel didPressHot];
	XCTAssertEqual(personObject.personStatus, PersonStatusHot);
}

- (void)testDidPressNotDoesSetCurrentPersonStatusToNot {
	PersonObject *personObject = [[PersonObject alloc] init];
	_dataProvider.currentSelectedPerson = personObject;
	[_viewModel didPressNot];
	XCTAssertEqual(personObject.personStatus, PersonStatusNot);
}

@end

