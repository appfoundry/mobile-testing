//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PersonView : UIView

@property (nonatomic, readonly, weak) UILabel *nameLabel;
@property (nonatomic, readonly, weak) UILabel *sloganLabel;
@property (nonatomic, readonly, weak) UILabel *ageLabel;
@property (nonatomic, readonly, weak) UILabel *locationLabel;
@property (nonatomic, readonly, weak) UIImageView *personImageView;
@property (nonatomic, readonly, weak) UIView *hotOrNotView;

@end