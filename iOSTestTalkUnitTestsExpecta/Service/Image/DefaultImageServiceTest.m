//
//  DefaultImageServiceTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 04/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "ExpectaOCMockTests.h"
#import "DefaultImageService.h"
#import "HTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import "OCMockito.h"

SpecBegin(_DefaultImageService)

describe(@"DefaultImageService", ^{
	__block DefaultImageService *_imageService;
	__block OCMockObject<HTTPRequestOperationManager> *_requestOperationManager;
	__block id<AFImageCache> _imageCache;
	__block UIImage *_fallbackImage;
	__block NSURL *_givenURL;
	__block UIImageView *_imageView;

	beforeEach(^{
		_requestOperationManager = OCMProtocolMock(@protocol(HTTPRequestOperationManager));
		_imageCache = OCMProtocolMock(@protocol(AFImageCache));
		_fallbackImage = [[UIImage alloc] init];
		_givenURL = [[NSURL alloc] initWithString:@"www.apple.com"];
		_imageView = [[UIImageView alloc] init];
		_imageService = [[DefaultImageService alloc] initWithHttpRequestManager:_requestOperationManager imageCache:_imageCache];
	});

	it(@"does set fallback image", ^{
		[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
		expect(_imageView.image).to.equal(_fallbackImage);
	});

	it(@"does set cached image if found", ^{
		UIImage *givenCachedImage = [[UIImage alloc] init];
		OCMExpect([_imageCache cachedImageForRequest:[NSURLRequest requestWithURL:_givenURL]]).andReturn(givenCachedImage);
		[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
		expect(_imageView.image).to.equal(givenCachedImage);
	});

	it(@"does cache image when downloaded", ^{
		UIImage *givenDownloadedImage = [[UIImage alloc] init];
		OCMExpect([_requestOperationManager GET:_givenURL.absoluteString parameters:nil success:[OCMArg checkWithBlock:^BOOL(void (^successBlock)(AFHTTPRequestOperation *operation, id responseObject)) {
			successBlock([[AFHTTPRequestOperation alloc] init], givenDownloadedImage);
			return YES;
		}] failure:[OCMArg any]]);
		[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
		OCMExpect([_imageCache cacheImage:givenDownloadedImage forRequest:[NSURLRequest requestWithURL:_givenURL]]);
	});

	it(@"does set image when downloaded", ^{
		UIImage *givenDownloadedImage = [[UIImage alloc] init];
		OCMExpect([_requestOperationManager GET:_givenURL.absoluteString parameters:nil success:[OCMArg checkWithBlock:^BOOL(void (^successBlock)(AFHTTPRequestOperation *operation, id responseObject)) {
			successBlock([[AFHTTPRequestOperation alloc] init], givenDownloadedImage);
			return YES;
		}] failure:[OCMArg any]]);
		[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
		expect(_imageView.image).to.equal(givenDownloadedImage);
	});

});

SpecEnd