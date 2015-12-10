//
//  AppDelegate.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 22/11/15.
//  Copyright © 2015 Joris Dubois. All rights reserved.
//

#import "AppDelegate.h"
#import "HotOrNotViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    if (NSClassFromString(@"XCTestCase")) {
//        return YES;
//    }
    
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	_window.rootViewController = [[HotOrNotViewController alloc] init];
	[_window makeKeyAndVisible];
    return YES;
}

@end
