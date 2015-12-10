//
//  DefaultImageServiceTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 03/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DefaultImageService.h"
#import "HTTPRequestOperationManagerMock.h"
#import "AFImageCacheMock.h"
#import "HTTPRequestOperationMock.h"

@interface DefaultImageServiceTest : XCTestCase {
	DefaultImageService *_imageService;
	HTTPRequestOperationManagerMock *_requestOperationManager;
	AFImageCacheMock *_imageCache;

	UIImage *_fallbackImage;
	NSURL *_givenURL;
	UIImageView *_imageView;
}

@end

@implementation DefaultImageServiceTest

- (void)setUp {
	[super setUp];
	_requestOperationManager = [[HTTPRequestOperationManagerMock alloc] init];
	_imageCache = [[AFImageCacheMock alloc] init];
	_fallbackImage = [[UIImage alloc] init];
	_givenURL = [[NSURL alloc] initWithString:@"www.apple.com"];
	_imageView = [[UIImageView alloc] init];
	_imageService = [[DefaultImageService alloc] initWithHttpRequestManager:_requestOperationManager imageCache:_imageCache];
}

- (void)testFetchImageFromURLDoesSetFallBackImage {
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	XCTAssertEqualObjects(_imageView.image, _fallbackImage);
}

- (void)testFetchImageFromURLDoesSetCachedImageIfFound {
	UIImage *givenCachedImage = [[UIImage alloc] init];
	_imageCache.givenCachedImage = givenCachedImage;
	_imageCache.expectedURLRequest = [NSURLRequest requestWithURL:_givenURL];
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	XCTAssertEqualObjects(_imageView.image, givenCachedImage);
}

- (void)testFetchImageFromURLDoesDownloadImageWithExpectedURL {
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	XCTAssertEqualObjects(_requestOperationManager.capturedURLString, _givenURL.absoluteString);
}

- (void)testFetchImageFromURLDoesDownloadImageWithExpectedParameters {
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	XCTAssertNil(_requestOperationManager.capturedParameters);
}

- (void)testFetchImageFromURLDoesCacheImageWhenDownloaded {
	UIImage *givenDownloadedImage = [[UIImage alloc] init];
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	_requestOperationManager.capturedSuccessBlock((HTTPRequestOperation<HTTPRequestOperation> *)[[HTTPRequestOperationMock alloc] init], givenDownloadedImage);
	XCTAssertEqualObjects(_imageCache.capturedCachedImage, givenDownloadedImage);
}

- (void)testFetchImageFromURLDoesSetImageOnImageViewWhenDownloaded {
	UIImage *givenDownloadedImage = [[UIImage alloc] init];
	[_imageService fetchImageFromURL:_givenURL fallBackImage:_fallbackImage forImageView:_imageView];
	_requestOperationManager.capturedSuccessBlock((HTTPRequestOperation<HTTPRequestOperation> *)[[HTTPRequestOperationMock alloc] init], givenDownloadedImage);
	XCTAssertEqualObjects(_imageView.image, givenDownloadedImage);
}

@end