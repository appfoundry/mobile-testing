//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "ImageServiceMock.h"

@interface ImageServiceMock()

@property (nonatomic, strong) NSURL *capturedImageURL;
@property (nonatomic, strong) UIImage *capturedFallBackImage;
@property (nonatomic, strong) UIImageView *capturedImageView;

@end

@implementation ImageServiceMock

- (void)fetchImageFromURL:(NSURL *)url fallBackImage:(UIImage *)fallBackImage forImageView:(UIImageView *)imageView {
	self.capturedImageURL = url;
	self.capturedFallBackImage = fallBackImage;
	self.capturedImageView = imageView;
}

@end