//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "PersonViewPopulator.h"
#import "PersonView.h"
#import "PersonObject.h"
#import "ImageService.h"
#import "UIImage+TTImage.h"
#import "UIColor+TTColor.h"

@interface PersonViewPopulator() {
	id<ImageService> _imageService;
	NSDictionary<NSNumber *, UIColor *> *_colorRegister;
}
@end

@implementation PersonViewPopulator

- (instancetype)initWithImageService:(id <ImageService>)imageService {
	self = [super init];
	if (self) {
		_colorRegister = @{
				@(PersonStatusUnknown) : [UIColor clearColor],
				@(PersonStatusHot) : [UIColor hotColor],
				@(PersonStatusNot) : [UIColor notColor]
		};
		_imageService = imageService;
	}
	return self;
}

- (void)populateView:(UIView *)view withData:(id)data {
	PersonView *personView = (PersonView *)view;
	PersonObject *personObject = (PersonObject *)data;
	personView.nameLabel.text = personObject.name;
	personView.sloganLabel.text = [NSString stringWithFormat:@"'%@'", personObject.slogan];
	personView.locationLabel.text = personObject.location;
	personView.ageLabel.text = [personObject.age stringValue];
	personView.hotOrNotView.backgroundColor = _colorRegister[@(personObject.personStatus)];
	[_imageService fetchImageFromURL:personObject.imageURL fallBackImage:[UIImage personFallBackImage] forImageView:personView.personImageView];
}

@end