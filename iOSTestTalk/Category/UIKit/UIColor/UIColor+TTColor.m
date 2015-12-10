//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "UIColor+TTColor.h"

@implementation UIColor (TTColor)

+ (UIColor *)hotColor {
	return [UIColor colorWithRed:255 green:0 blue:0 alpha:1.0f];
}

+ (UIColor *)notColor {
	return [UIColor colorWithRed:0 green:0 blue:255 alpha:1.0f];
}

@end