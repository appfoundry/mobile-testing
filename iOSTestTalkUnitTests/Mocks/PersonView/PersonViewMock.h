//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PersonViewMock : UIView

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sloganLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UIImageView *personImageView;
@property (nonatomic, strong) UIView *hotOrNotView;

@end