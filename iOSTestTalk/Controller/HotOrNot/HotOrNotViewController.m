//
//  HotOrNottViewController.m
//  iOSTestTalk
//
//  Created by Joris Dubois on 29/11/15.
//  Copyright © 2015 Joris Dubois. All rights reserved.
//

#import "HotOrNotViewController.h"
#import "HotOrNotViewModel.h"
#import "HotOrNotContextBuilder.h"
#import "PersonView.h"

@interface HotOrNotViewController () {
	PersonView *_personView;
}
@property (nonatomic, strong) HotOrNotViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UIView *personContainer;
@end


@implementation HotOrNotViewController

- (void)viewDidLoad {
	HotOrNotContextBuilder *contextBuilder = [[HotOrNotContextBuilder alloc] init];
	_viewModel = contextBuilder.hotOrNotViewModel;
	_personView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PersonView class]) owner:nil options:nil][0];
	_personView.frame = self.personContainer.bounds;
	[self.personContainer addSubview:_personView];
	[self _repopulate];
}

- (IBAction)didPressHot:(id)sender {
	[self.viewModel didPressHot];
	[self _repopulate];
}

- (IBAction)didPressNot:(id)sender {
	[self.viewModel didPressNot];
	[self _repopulate];
}

- (IBAction)swipeLeft:(id)sender {
    [self.viewModel didSwipeLeft];
	[self _repopulate];
}

- (IBAction)swipeRight:(id)sender {
	[self.viewModel didSwipeRight];
	[self _repopulate];
}

- (void)_repopulate {
	[self.viewModel populatePersonView:_personView];
}

@end
