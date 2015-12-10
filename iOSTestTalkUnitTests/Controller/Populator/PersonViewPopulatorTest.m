//
//  PersonViewPopulatorTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 03/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PersonViewPopulator.h"
#import "PersonObject.h"
#import "PersonViewMock.h"
#import "ImageServiceMock.h"
#import "UIImage+TTImage.h"
#import "UIColor+TTColor.h"

@interface PersonViewPopulatorTest : XCTestCase {
	PersonViewPopulator *_populator;
	PersonObject *_data;
	PersonViewMock *_view;
	ImageServiceMock *_imageService;
	NSURL *_imageURL;
}

@end

@implementation PersonViewPopulatorTest

- (void)setUp {
	[super setUp];
	_imageURL = [[NSURL alloc] initWithString:@"http://www.apple.com"];
	_view = [[PersonViewMock alloc] init];
	_imageService = [[ImageServiceMock alloc] init];
	_populator = [[PersonViewPopulator alloc] initWithImageService:_imageService];
	_data = [[PersonObject alloc] initWithName:@"expectedName" imageURL:_imageURL slogan:@"expectedSlogan" location:@"expectedLocation" age:@25];
}

- (void)testPopulateViewWithDataDoesPopulateNameLabelWithName {
	UILabel *givenLabel = [[UILabel alloc] init];
	_view.nameLabel = givenLabel;
	[_populator populateView:_view withData:_data];
	XCTAssertEqual(givenLabel.text, _data.name);
}

- (void)testPopulateViewWithDataDoesInvokeImageServiceForPersonImageViewWithExpectedFallbackImage {
	UIImageView *givenImageView = [[UIImageView alloc] init];
	_view.personImageView = givenImageView;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(_imageService.capturedFallBackImage, [UIImage personFallBackImage]);
}

- (void)testPopulateViewWithDataDoesInvokeImageServiceForPersonImageViewWithExpectedImageURL {
	UIImageView *givenImageView = [[UIImageView alloc] init];
	_view.personImageView = givenImageView;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(_imageService.capturedImageURL, _data.imageURL);
}

- (void)testPopulateViewWithDataDoesInvokeImageServiceForPersonImageViewWithExpectedImageView {
	UIImageView *givenImageView = [[UIImageView alloc] init];
	_view.personImageView = givenImageView;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(_imageService.capturedImageView, givenImageView);
}

- (void)testPopulateViewWithDataDoesPopulateSloganLabelWithSlogan {
	UILabel *givenLabel = [[UILabel alloc] init];
	_view.sloganLabel = givenLabel;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(givenLabel.text, ([NSString stringWithFormat:@"'%@'", _data.slogan]));
}

- (void)testPopulateViewWithDataDoesPopulateLocationLabelWithLocation {
	UILabel *givenLabel = [[UILabel alloc] init];
	_view.locationLabel = givenLabel;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(givenLabel.text, _data.location);
}

- (void)testPopulateViewWithDataDoesPopulateAgeLabelWithAge {
	UILabel *givenLabel = [[UILabel alloc] init];
	_view.ageLabel = givenLabel;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(givenLabel.text, _data.age.stringValue);
}

- (void)testPopulateViewWithDataDoesPopulateHotOrNotBackgroundColorIfStatusUnknown {
	_data.personStatus = PersonStatusUnknown;
	UIView *givenView = [[UIView alloc] init];
	_view.hotOrNotView = givenView;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(givenView.backgroundColor, [UIColor clearColor]);
}

- (void)testPopulateViewWithDataDoesPopulateHotOrNotBackgroundColorIfStatusHot {
	_data.personStatus = PersonStatusHot;
	UIView *givenView = [[UIView alloc] init];
	_view.hotOrNotView = givenView;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(givenView.backgroundColor, [UIColor hotColor]);
}

- (void)testPopulateViewWithDataDoesPopulateHotOrNotBackgroundColorIfStatusNot {
	_data.personStatus = PersonStatusNot;
	UIView *givenView = [[UIView alloc] init];
	_view.hotOrNotView = givenView;
	[_populator populateView:_view withData:_data];
	XCTAssertEqualObjects(givenView.backgroundColor, [UIColor notColor]);
}

@end