//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonDataProvider.h"

@interface PersonDataProviderMock : NSObject <PersonDataProvider>

@property (nonatomic, strong) PersonObject *currentSelectedPerson;

@end