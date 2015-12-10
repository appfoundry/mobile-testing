//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface AFImageCacheMock : NSObject<AFImageCache>

@property (nonatomic, strong) NSURLRequest *expectedURLRequest;
@property (nonatomic, strong) UIImage *givenCachedImage;

@property (nonatomic, strong) UIImage *capturedCachedImage;
@property (nonatomic, strong) NSURLRequest *capturedCachedRequest;

@end