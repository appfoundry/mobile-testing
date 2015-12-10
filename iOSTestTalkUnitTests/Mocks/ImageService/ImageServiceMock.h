//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageService.h"

@interface ImageServiceMock : NSObject <ImageService>

@property (nonatomic, readonly) NSURL *capturedImageURL;
@property (nonatomic, readonly) UIImage *capturedFallBackImage;
@property (nonatomic, readonly) UIImageView *capturedImageView;

@end