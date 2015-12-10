//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PersonStatus) {
	PersonStatusUnknown,
	PersonStatusHot,
	PersonStatusNot
};

@interface PersonObject : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSURL *imageURL;
@property (nonatomic, readonly) NSString *slogan;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSNumber *age;
@property (nonatomic) PersonStatus personStatus;

- (instancetype)initWithName:(NSString *)name imageURL:(NSURL *)imageURL slogan:(NSString *)slogan location:(NSString *)location age:(NSNumber *)age;

@end