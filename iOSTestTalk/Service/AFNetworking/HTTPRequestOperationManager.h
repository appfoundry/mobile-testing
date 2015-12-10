//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;
@class HTTPRequestOperation;

@protocol HTTPRequestOperationManager <NSObject>

- (HTTPRequestOperation *)GET:(NSString *)URLString
					 parameters:(id)parameters
						success:(void (^)(HTTPRequestOperation *operation, id responseObject))success
						failure:(void (^)(HTTPRequestOperation *operation, NSError *error))failure;

@end