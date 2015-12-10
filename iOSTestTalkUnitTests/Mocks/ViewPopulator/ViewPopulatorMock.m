//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "ViewPopulatorMock.h"

@interface ViewPopulatorMock()

@property (nonatomic, strong) UIView *capturedView;
@property (nonatomic, strong) id capturedData;

@end

@implementation ViewPopulatorMock

- (void)populateView:(UIView *)view withData:(id)data {
	self.capturedView = view;
	self.capturedData = data;
}

@end