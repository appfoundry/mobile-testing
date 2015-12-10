//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "HotOrNotViewModel.h"
#import "PersonView.h"
#import "PersonDataProvider.h"
#import "ViewPopulator.h"
#import "PersonObject.h"

@interface HotOrNotViewModel() {
	id<ViewPopulator> _personViewPopulator;
	id<PersonDataProvider> _personDataProvider;
}
@end

@implementation HotOrNotViewModel

- (instancetype)initWithPersonViewPopulator:(id<ViewPopulator>)personViewPopulator personDataProvider:(id<PersonDataProvider>)personDataProvider {
	self = [super init];
	if (self) {
		_personViewPopulator = personViewPopulator;
		_personDataProvider = personDataProvider;
	}
	return self;
}

- (void)populatePersonView:(PersonView *)personView {
	[_personViewPopulator populateView:personView withData:_personDataProvider.currentSelectedPerson];
}

- (void)didPressHot {
	_personDataProvider.currentSelectedPerson.personStatus = PersonStatusHot;
}

- (void)didPressNot {
	_personDataProvider.currentSelectedPerson.personStatus = PersonStatusNot;
}

- (void)didSwipeLeft {
	[_personDataProvider switchToNext];
}

- (void)didSwipeRight {
	[_personDataProvider switchToPrevious];
}

@end