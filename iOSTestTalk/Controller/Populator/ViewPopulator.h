//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ViewPopulator <NSObject>

- (void)populateView:(UIView *)view withData:(id)data;

@end