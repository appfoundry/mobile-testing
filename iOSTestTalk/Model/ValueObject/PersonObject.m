//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "PersonObject.h"

@implementation PersonObject

- (instancetype)initWithName:(NSString *)name imageURL:(NSURL *)imageURL slogan:(NSString *)slogan location:(NSString *)location age:(NSNumber *)age {
	self = [super init];
	if (self) {
		_personStatus = PersonStatusUnknown;
		_name = name;
		_imageURL = imageURL;
		_slogan = slogan;
		_location = location;
		_age = age;
	}
	return self;
}

@end