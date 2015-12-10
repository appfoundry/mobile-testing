//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "HTTPRequestOperationManagerMock.h"

@interface HTTPRequestOperationManagerMock()

@property (nonatomic, strong) NSString *capturedURLString;
@property (nonatomic, strong) id capturedParameters;

@end

@implementation HTTPRequestOperationManagerMock

- (HTTPRequestOperation *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(HTTPRequestOperation *operation, id responseObject))success failure:(void (^)(HTTPRequestOperation *operation, NSError *error))failure {
	self.capturedURLString = URLString;
	self.capturedParameters = parameters;
	self.capturedSuccessBlock = success;
	self.capturedFailureBlock = success;
	return nil;
}

@end