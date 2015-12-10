//
//  DefaultPersonDataProviderTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 04/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//


#import "ExpectaOCMockTests.h"
#import "DefaultPersonDataProvider.h"
#import "PersonObject.h"

SpecBegin(_DefaultPersonDataProvider)

	describe(@"DefaultPersonDataProvider", ^{
		__block DefaultPersonDataProvider *_dataProvider;
		__block NSArray *_persons;

		beforeEach(^{
			_persons = @[[[PersonObject alloc] init], [[PersonObject alloc] init], [[PersonObject alloc] init]];
			_dataProvider = [[DefaultPersonDataProvider alloc] initWithData:_persons];
		});

		it(@"currentSelectedPerson is first person on init", ^{
			expect(_dataProvider.currentSelectedPerson).to.equal(_persons[0]);
		});

		it(@"currentSelectedPerson is second person when index out of bounds while switching next", ^{
			[_dataProvider switchToNext];
			expect(_dataProvider.currentSelectedPerson).to.equal(_persons[1]);
		});

		it(@"currentSelectedPerson is last person when index out of bounds while switching next", ^{
			[_dataProvider switchToNext];
			[_dataProvider switchToNext];
			[_dataProvider switchToNext];
			expect(_dataProvider.currentSelectedPerson).to.equal(_persons[2]);
		});

		it(@"currentSelectedPerson is last person when index out of bounds while switching next", ^{
			[_dataProvider switchToNext];
			[_dataProvider switchToPrevious];
			expect(_dataProvider.currentSelectedPerson).to.equal(_persons[0]);
		});
	});

SpecEnd