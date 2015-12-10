//
//  HotOrNotViewModelTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 04/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "ExpectaOCMockTests.h"
#import "PersonDataProvider.h"
#import "ViewPopulator.h"
#import "HotOrNotViewModel.h"
#import "PersonObject.h"
#import "PersonView.h"

SpecBegin(_HotOrNotViewModel)

	describe(@"HotOrNotViewModel", ^{
		__block id<PersonDataProvider> _dataProvider;
		__block id<ViewPopulator> _viewPopulator;
		__block HotOrNotViewModel *_viewModel;

		beforeEach(^{
			_dataProvider = OCMProtocolMock(@protocol(PersonDataProvider));
			_viewPopulator = OCMProtocolMock(@protocol(ViewPopulator));
			_viewModel = [[HotOrNotViewModel alloc] initWithPersonViewPopulator:_viewPopulator personDataProvider:_dataProvider];
		});

		it(@"invokes view populator with currentSelectedPerson from DataProvider", ^{
			PersonView *personView = [[PersonView alloc] init];
			PersonObject *personObject = [[PersonObject alloc] init];
			OCMExpect(_dataProvider.currentSelectedPerson).andReturn(personObject);
			[_viewModel populatePersonView:personView];
			OCMVerify([_viewPopulator populateView:personView withData:personObject]);
		});

		it(@"sets StatusHot when HotButton pressed", ^{
			PersonObject *personObject = [[PersonObject alloc] init];
			OCMExpect(_dataProvider.currentSelectedPerson).andReturn(personObject);
			[_viewModel didPressHot];
			expect(personObject.personStatus).to.equal(PersonStatusHot);
		});

		it(@"sets StatusNot when NotButton pressed", ^{
			PersonObject *personObject = [[PersonObject alloc] init];
			OCMExpect(_dataProvider.currentSelectedPerson).andReturn(personObject);
			[_viewModel didPressNot];
			expect(personObject.personStatus).to.equal(PersonStatusNot);
		});

	});

SpecEnd