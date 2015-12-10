//
//  PersonViewPopulatorTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 29/11/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "OCMockitoOCHamcrestTests.h"
#import "PersonViewPopulator.h"
#import "PersonObject.h"
#import "PersonView.h"
#import "ImageService.h"
#import "UIImage+TTImage.h"
#import "UIColor+TTColor.h"

@interface PersonViewPopulatorTest : XCTestCase {
	PersonViewPopulator *_populator;
	PersonObject *_data;
	PersonView *_view;
	id<ImageService> _imageService;
	NSURL *_imageURL;
}

@end

@implementation PersonViewPopulatorTest

- (void)setUp {
    [super setUp];
	_imageURL = [[NSURL alloc] initWithString:@"http://www.apple.com"];
	_view = mock([PersonView class]);
	_imageService = mockProtocol(@protocol(ImageService));
	_populator = [[PersonViewPopulator alloc] initWithImageService:_imageService];
	_data = [[PersonObject alloc] initWithName:@"expectedName" imageURL:_imageURL slogan:@"expectedSlogan" location:@"expectedLocation" age:@25];
}

- (void)testPopulateViewWithDataDoesPopulateNameLabelWithName {
	UILabel *givenLabel = [[UILabel alloc] init];
	[given(_view.nameLabel) willReturn:givenLabel];
	[_populator populateView:_view withData:_data];
	assertThat(givenLabel.text, is(equalTo(_data.name)));
}

- (void)testPopulateViewWithDataDoesInvokeImageServiceForPersonImageViewWithExpectedFallbackImage {
	UIImageView *givenImageView = [[UIImageView alloc] init];
	[given(_view.personImageView) willReturn:givenImageView];
	[_populator populateView:_view withData:_data];
	[verify(_imageService) fetchImageFromURL:_data.imageURL fallBackImage:[UIImage personFallBackImage] forImageView:givenImageView];
}

- (void)testPopulateViewWithDataDoesPopulateSloganLabelWithSlogan {
	UILabel *givenLabel = [[UILabel alloc] init];
	[given(_view.sloganLabel) willReturn:givenLabel];
	[_populator populateView:_view withData:_data];
	assertThat(givenLabel.text, is(equalTo([NSString stringWithFormat:@"'%@'", _data.slogan])));
}

- (void)testPopulateViewWithDataDoesPopulateLocationLabelWithLocation {
	UILabel *givenLabel = [[UILabel alloc] init];
	[given(_view.locationLabel) willReturn:givenLabel];
	[_populator populateView:_view withData:_data];
	assertThat(givenLabel.text, is(equalTo(_data.location)));
}

- (void)testPopulateViewWithDataDoesPopulateAgeLabelWithAge {
	UILabel *givenLabel = [[UILabel alloc] init];
	[given(_view.ageLabel) willReturn:givenLabel];
	[_populator populateView:_view withData:_data];
	assertThat(givenLabel.text, is(equalTo(_data.age.stringValue)));
}

- (void)testPopulateViewWithDataDoesPopulateHotOrNotBackgroundColorIfStatusUnknown {
	_data.personStatus = PersonStatusUnknown;
	UIView *givenView = [[UIView alloc] init];
	[given(_view.hotOrNotView) willReturn:givenView];
	[_populator populateView:_view withData:_data];
	assertThat(givenView.backgroundColor, is(equalTo([UIColor clearColor])));
}

- (void)testPopulateViewWithDataDoesPopulateHotOrNotBackgroundColorIfStatusHot {
	_data.personStatus = PersonStatusHot;
	UIView *givenView = [[UIView alloc] init];
	[given(_view.hotOrNotView) willReturn:givenView];
	[_populator populateView:_view withData:_data];
	assertThat(givenView.backgroundColor, is(equalTo([UIColor hotColor])));
}

- (void)testPopulateViewWithDataDoesPopulateHotOrNotBackgroundColorIfStatusNot {
	_data.personStatus = PersonStatusNot;
	UIView *givenView = [[UIView alloc] init];
	[given(_view.hotOrNotView) willReturn:givenView];
	[_populator populateView:_view withData:_data];
	assertThat(givenView.backgroundColor, is(equalTo([UIColor notColor])));
}

@end
