//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "DefaultPersonDataProvider.h"
#import "PersonObject.h"

@interface DefaultPersonDataProvider () {
	NSUInteger _currentIndex;
}

@property (nonatomic, strong) PersonObject *currentSelectedPerson;
@property (nonatomic, strong) NSArray<PersonObject *> *persons;

@end

@implementation DefaultPersonDataProvider

- (instancetype)initWithData:(NSArray<PersonObject *> *)personObjects {
	self = [super init];
	if (self) {
        _persons = personObjects;
		[self recalculateCurrentPerson];
	}
	return self;
}

- (void)switchToNext {
	if (_currentIndex < (_persons.count-1)) {
		_currentIndex++;
	}
	[self recalculateCurrentPerson];
}

- (void)switchToPrevious {
	if(_currentIndex != 0) {
		_currentIndex--;
	}
	[self recalculateCurrentPerson];
}

- (void)recalculateCurrentPerson {
	self.currentSelectedPerson = _persons[_currentIndex];
}


@end