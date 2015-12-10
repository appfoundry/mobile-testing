//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageService.h"

@protocol HTTPRequestOperationManager;
@protocol AFImageCache;

@interface DefaultImageService : NSObject <ImageService>

- (instancetype)initWithHttpRequestManager:(id <HTTPRequestOperationManager>)httpRequestManager imageCache:(id <AFImageCache>)imageCache;

@end