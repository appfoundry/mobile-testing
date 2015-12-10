//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PersonObject;

@protocol PersonDataProvider <NSObject>

@property (nonatomic, readonly) PersonObject *currentSelectedPerson;

- (void)switchToNext;
- (void)switchToPrevious;

@end