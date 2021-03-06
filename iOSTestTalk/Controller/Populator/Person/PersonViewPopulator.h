//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewPopulator.h"

@protocol ImageService;

@interface PersonViewPopulator : NSObject <ViewPopulator>

- (instancetype)initWithImageService:(id<ImageService>)imageService;

@end