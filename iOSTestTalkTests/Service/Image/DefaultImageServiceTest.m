//
//  DefaultImageServiceTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 29/11/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "OCMockitoOCHamcrestTests.h"
#import "HTTPRequestOperationManager.h"
#import "DefaultImageService.h"
#import "UIImageView+AFNetworking.h"
#import "AFHTTPRequestOperation.h"

@interface DefaultImageServiceTest : XCTestCase {
	DefaultImageService *_imageService;
	id<HTTPRequestOperationManager> _requestOperationManager;
	id<AFImageCache> _imageCache;

	UIImage *_fallbackImage;
	NSURL *_givenURL;
	UIImageView *_imageView;
}

@end

@implementation DefaultImageServiceTest

- (void)setUp {
    [super setUp];
	_requestOperationManager = mockProtocol(@protocol(HTTPRequestOperationManager));
	_imageCache = mockProtocol(@protocol(AFImageCache));
	_fallbackImage = [[UIImage alloc] init];
	_givenURL = [[NSURL alloc] initWithString:@"www.apple.com"];
	_imageView = mock([UIImageView class]);
	_imageService = [[DefaultImageService alloc] initWithHttpRequestManager:_requestOperationManager imageCache:_imageCache];
}

- (void)testFetchImageFromURLDoesSetFallBackImage {
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	[verify(_imageView) setImage:_fallbackImage];
}

- (void)testFetchImageFromURLDoesSetCachedImageIfFound {
	UIImage *givenCachedImage = [[UIImage alloc] init];
	[given([_imageCache cachedImageForRequest:[NSURLRequest requestWithURL:_givenURL]]) willReturn:givenCachedImage];
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	[verify(_imageView) setImage:givenCachedImage];
}

- (void)testFetchImageFromURLDoesCacheImageWhenDownloaded {
	UIImage *givenDownloadedImage = [[UIImage alloc] init];
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	HCArgumentCaptor *captor = [[HCArgumentCaptor alloc] init];
	[verify(_requestOperationManager) GET:_givenURL.absoluteString parameters:nil success:(id)captor failure:anything()];
	void (^successBlock)(AFHTTPRequestOperation *, id) = [captor value];
	successBlock([[AFHTTPRequestOperation alloc] init], givenDownloadedImage);
	[verify(_imageCache) cacheImage:givenDownloadedImage forRequest:[NSURLRequest requestWithURL:_givenURL]];
}

- (void)testFetchImageFromURLDoesSetImageOnImageViewWhenDownloaded {
	UIImage *givenDownloadedImage = [[UIImage alloc] init];
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	HCArgumentCaptor *captor = [[HCArgumentCaptor alloc] init];
	[verify(_requestOperationManager) GET:_givenURL.absoluteString parameters:nil success:(id)captor failure:anything()];
	void (^successBlock)(AFHTTPRequestOperation *, id) = [captor value];
	successBlock([[AFHTTPRequestOperation alloc] init], givenDownloadedImage);
	[verify(_imageView) setImage:givenDownloadedImage];
}

@end
