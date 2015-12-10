//
//  HotOrNotViewModelTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 29/11/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "OCMockitoOCHamcrestTests.h"
#import "HotOrNotViewModel.h"
#import "PersonView.h"
#import "ViewPopulator.h"
#import "PersonDataProvider.h"
#import "PersonObject.h"

@interface HotOrNotViewModelTest : XCTestCase {
	id<PersonDataProvider> _dataProvider;
	id<ViewPopulator> _viewPopulator;
	HotOrNotViewModel *_viewModel;
}

@end

@implementation HotOrNotViewModelTest

- (void)setUp {
    [super setUp];
	_dataProvider = mockProtocol(@protocol(PersonDataProvider));
	_viewPopulator = mockProtocol(@protocol(ViewPopulator));
	_viewModel = [[HotOrNotViewModel alloc] initWithPersonViewPopulator:_viewPopulator personDataProvider:_dataProvider];
}

- (void)testPopulatePersonViewDoesInvokeViewPopulatorWithCurrentSelectedPersonFromDataProvider {
	PersonView *personView = [[PersonView alloc] init];
	PersonObject *personObject = [[PersonObject alloc] init];
	[given(_dataProvider.currentSelectedPerson) willReturn:personObject];
	[_viewModel populatePersonView:personView];
	[verify(_viewPopulator) populateView:personView withData:personObject];
}

- (void)testDidPressHotDoesSetCurrentPersonStatusToHot {
	PersonObject *personObject = [[PersonObject alloc] init];
	[given(_dataProvider.currentSelectedPerson) willReturn:personObject];
	[_viewModel didPressHot];
	assertThatUnsignedInt(personObject.personStatus, is(equalToUnsignedInt(PersonStatusHot)));
}

- (void)testDidPressNotDoesSetCurrentPersonStatusToNot {
	PersonObject *personObject = [[PersonObject alloc] init];
	[given(_dataProvider.currentSelectedPerson) willReturn:personObject];
	[_viewModel didPressNot];
	assertThatUnsignedInt(personObject.personStatus, is(equalToUnsignedInt(PersonStatusNot)));
}

- (void)testDidSwipeLeftDoesInvokeSwitchToNextOnDataProvider {
    [_viewModel didSwipeLeft];
    [verify(_dataProvider) switchToNext];
}

- (void)testDidSwipeRightDoesInvokeSwitchToPreviousOnDataProvider {
    [_viewModel didSwipeRight];
    [verify(_dataProvider) switchToPrevious];
}

@end
