//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PersonView;
@protocol PersonDataProvider;
@protocol ViewPopulator;

@interface HotOrNotViewModel : NSObject

- (instancetype)initWithPersonViewPopulator:(id<ViewPopulator>)personViewPopulator personDataProvider:(id<PersonDataProvider>)personDataProvider;

- (void)populatePersonView:(PersonView *)personView;
- (void)didPressHot;
- (void)didPressNot;
- (void)didSwipeLeft;
- (void)didSwipeRight;

@end