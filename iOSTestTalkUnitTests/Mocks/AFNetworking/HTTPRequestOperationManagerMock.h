//
// Created by Joris Dubois on 03/12/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequestOperationManager.h"

@interface HTTPRequestOperationManagerMock : NSObject <HTTPRequestOperationManager>

@property (nonatomic, readonly) NSString *capturedURLString;
@property (nonatomic, readonly) id capturedParameters;
@property (nonatomic, copy) void (^capturedSuccessBlock)(HTTPRequestOperation *, id);
@property (nonatomic, copy) void (^capturedFailureBlock)(HTTPRequestOperation *, NSError *);

@end