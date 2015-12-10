//
// Created by Joris Dubois on 29/11/15.
// Copyright (c) 2015 Joris Dubois. All rights reserved.
//

#import "HotOrNotContextBuilder.h"
#import "HotOrNotViewModel.h"
#import "PersonViewPopulator.h"
#import "DefaultImageService.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperationManager+HTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "DefaultPersonDataProvider.h"
#import "PersonObject.h"

@implementation HotOrNotContextBuilder

- (HotOrNotViewModel *)hotOrNotViewModel {
	return [[HotOrNotViewModel alloc] initWithPersonViewPopulator:[self _createPersonViewPopulator] personDataProvider:[self _createPersonDataProvider]];
}

- (PersonViewPopulator *)_createPersonViewPopulator {
	return [[PersonViewPopulator alloc] initWithImageService:[self _createImageService]];
}

- (id<ImageService>)_createImageService {
	AFHTTPRequestOperationManager *requestOperationManager = [[AFHTTPRequestOperationManager alloc] init];
	requestOperationManager.responseSerializer = [AFImageResponseSerializer serializer];
	return [[DefaultImageService alloc] initWithHttpRequestManager:requestOperationManager imageCache:[UIImageView sharedImageCache]];
}

- (id <PersonDataProvider>)_createPersonDataProvider {
    return [[DefaultPersonDataProvider alloc] initWithData:@[
		[[PersonObject alloc] initWithName:@"Nicolas Cage" imageURL:[[NSURL alloc] initWithString:@"http://ia.media-imdb.com/images/M/MV5BMTUzMDM4Nzk2MV5BMl5BanBnXkFtZTcwNTcwNjExOQ@@._V1__SX640_SY720_.jpg"] slogan:@"How deep is hell?" location:@"California, USA" age:@51],
		[[PersonObject alloc] initWithName:@"Jim Parsons" imageURL:[[NSURL alloc] initWithString:@"http://ia.media-imdb.com/images/M/MV5BMjA3MzIzMjM5Nl5BMl5BanBnXkFtZTgwOTI5OTQzMjE@._V1_SX640_SY720_.jpg"] slogan:@"Bazinga" location:@"Texas, USA" age:@42],
		[[PersonObject alloc] initWithName:@"Megan Fox" imageURL:[[NSURL alloc] initWithString:@"http://ia.media-imdb.com/images/M/MV5BOTA0NzMyMTE1M15BMl5BanBnXkFtZTcwNTk2NTIyMw@@._V1__SX640_SY720_.jpg"] slogan:@"I'll drive, you shoot!" location:@"Tennessee, USA" age:@29],
		[[PersonObject alloc] initWithName:@"Andrew Lincoln" imageURL:[[NSURL alloc] initWithString:@"http://ia.media-imdb.com/images/M/MV5BMjI2NDYyNjg4NF5BMl5BanBnXkFtZTcwMjI5OTMwNA@@._V1_UY317_CR9,0,214,317_AL_.jpg"] slogan:@"CARL!" location:@"London, UK" age:@42],
		[[PersonObject alloc] initWithName:@"Kaley Cuoco" imageURL:[[NSURL alloc] initWithString:@"http://ia.media-imdb.com/images/M/MV5BMTc4OTI0Njc2MV5BMl5BanBnXkFtZTcwMTQ3NjYyMw@@._V1_UY317_CR5,0,214,317_AL_.jpg"] slogan:@"Sweetie, every night you don't kill him in his sleep, he wins." location:@"California, USA" age:@29],
		[[PersonObject alloc] initWithName:@"Neil Patrick Harris" imageURL:[[NSURL alloc] initWithString:@"http://ia.media-imdb.com/images/M/MV5BMTUxNjQ4MjU5Ml5BMl5BanBnXkFtZTcwMTY5NzAzNw@@._V1_UY317_CR14,0,214,317_AL_.jpg"] slogan:@"It’s gonna be legend-... wait for it… DAIRY!" location:@"New Mexico, USA" age:@42],
	]];
}


@end