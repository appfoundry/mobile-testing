//
//  PersonViewPopulatorTest.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 04/12/15.
//  Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "ExpectaOCMockTests.h"
#import "PersonViewPopulator.h"
#import "PersonObject.h"
#import "PersonView.h"
#import "UIImage+TTImage.h"
#import "ImageService.h"
#import "UIColor+TTColor.h"

SpecBegin(_PersonViewPopulator)

	describe(@"PersonViewPopulator", ^{
		__block PersonViewPopulator *_populator;
		__block PersonObject *_data;
		__block PersonView *_view;
		__block id<ImageService> _imageService;
		__block NSURL *_imageURL;

		beforeEach(^{
			_imageURL = [[NSURL alloc] initWithString:@"http://www.apple.com"];
			_view = OCMClassMock([PersonView class]);
			_imageService = OCMProtocolMock(@protocol(ImageService));
			_populator = [[PersonViewPopulator alloc] initWithImageService:_imageService];
			_data = [[PersonObject alloc] initWithName:@"expectedName" imageURL:_imageURL slogan:@"expectedSlogan" location:@"expectedLocation" age:@25];
		});

		it(@"populates name label", ^{
			UILabel *givenLabel = [[UILabel alloc] init];
			OCMExpect(_view.nameLabel).andReturn(givenLabel);
			[_populator populateView:_view withData:_data];
            expect(givenLabel.text).to.equal(_data.name);
		});

		it(@"does invoke image service with expected fallback image", ^{
			UIImageView *givenImageView = [[UIImageView alloc] init];
			OCMExpect(_view.personImageView).andReturn(givenImageView);
			[_populator populateView:_view withData:_data];
			OCMVerify([_imageService fetchImageFromURL:_data.imageURL fallBackImage:[UIImage personFallBackImage] forImageView:givenImageView]);
		});

		it(@"populates slogan label", ^{
			UILabel *givenLabel = [[UILabel alloc] init];
			OCMExpect(_view.sloganLabel).andReturn(givenLabel);
			[_populator populateView:_view withData:_data];
			expect(givenLabel.text).to.equal([NSString stringWithFormat:@"'%@'", _data.slogan]);
		});

		it(@"populates location label", ^{
			UILabel *givenLabel = [[UILabel alloc] init];
			OCMExpect(_view.locationLabel).andReturn(givenLabel);
			[_populator populateView:_view withData:_data];
			expect(givenLabel.text).to.equal(_data.location);
		});

		it(@"populates age label", ^{
			UILabel *givenLabel = [[UILabel alloc] init];
			OCMExpect(_view.ageLabel).andReturn(givenLabel);
			[_populator populateView:_view withData:_data];
			expect(givenLabel.text).to.equal(_data.age.stringValue);
		});

		it(@"populates hotOrNotIndicator backgroundColor if StatusUnknown", ^{
			_data.personStatus = PersonStatusUnknown;
			UIView *givenView = [[UIView alloc] init];
			OCMExpect(_view.hotOrNotView).andReturn(givenView);
			[_populator populateView:_view withData:_data];
			expect(givenView.backgroundColor).to.equal([UIColor clearColor]);
		});

		it(@"populates hotOrNotIndicator backgroundColor if StatusHot", ^{
			_data.personStatus = PersonStatusHot;
			UIView *givenView = [[UIView alloc] init];
			OCMExpect(_view.hotOrNotView).andReturn(givenView);
			[_populator populateView:_view withData:_data];
			expect(givenView.backgroundColor).to.equal([UIColor hotColor]);
		});

		it(@"populates hotOrNotIndicator backgroundColor if StatusNot", ^{
			_data.personStatus = PersonStatusNot;
			UIView *givenView = [[UIView alloc] init];
			OCMExpect(_view.hotOrNotView).andReturn(givenView);
			[_populator populateView:_view withData:_data];
			expect(givenView.backgroundColor).to.equal([UIColor notColor]);
		});

	});

SpecEnd