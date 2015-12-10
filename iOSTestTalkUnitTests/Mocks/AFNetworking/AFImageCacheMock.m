//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "AFImageCacheMock.h"

@implementation AFImageCacheMock

- (UIImage *)cachedImageForRequest:(NSURLRequest *)request {
	UIImage *result;
	if([request isEqual:self.expectedURLRequest]){
		result = self.givenCachedImage;
	}
	return result;
}

- (void)cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request {
	self.capturedCachedImage = image;
	self.capturedCachedRequest = request;
}

@end