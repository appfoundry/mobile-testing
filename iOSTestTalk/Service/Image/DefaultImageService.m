//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "DefaultImageService.h"
#import "HTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import <AFNetworking/AFNetworking.h>


@interface DefaultImageService()  {
	id <HTTPRequestOperationManager> _httpRequestManager;
	id <AFImageCache> _imageCache;
}
@end

@implementation DefaultImageService

- (instancetype)initWithHttpRequestManager:(id <HTTPRequestOperationManager>)httpRequestManager imageCache:(id<AFImageCache>)imageCache {
	self = [super init];
	if (self) {
		_httpRequestManager = httpRequestManager;
		_imageCache = imageCache;
	}
	return self;
}

- (void)fetchImageFromURL:(NSURL *)url fallBackImage:(UIImage *)fallBackImage forImageView:(UIImageView *)imageView {
	imageView.image = fallBackImage;
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	UIImage *cachedImage = [_imageCache cachedImageForRequest:request];
	if (!cachedImage) {
		__block id<AFImageCache> weakImageCache = _imageCache;
		__block UIImageView *weakImageView = imageView;
		[_httpRequestManager GET:url.absoluteString parameters:nil success:^(HTTPRequestOperation *operation, id responseObject) {
			[weakImageCache cacheImage:responseObject forRequest:request];
			weakImageView.image = responseObject;
		} failure:^(HTTPRequestOperation *operation, NSError *error) {
			NSLog(@"image downloading failed with error: %@", error);
		}];
	} else {
		imageView.image = cachedImage;
	}
}

@end