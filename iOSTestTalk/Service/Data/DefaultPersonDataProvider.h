//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonDataProvider.h"

@interface DefaultPersonDataProvider : NSObject <PersonDataProvider>

- (instancetype)initWithData:(NSArray<PersonObject *> *)personObjects;

@end