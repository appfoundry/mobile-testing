//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewPopulator.h"

@interface ViewPopulatorMock : NSObject<ViewPopulator>

@property (nonatomic, readonly) UIView *capturedView;
@property (nonatomic, readonly) id capturedData;

@end