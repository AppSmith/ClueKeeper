//
//  CCViewController.m
//  Clue Ceeper
//
//  Created by Dana Smith on 3/29/12.
//  Copyright (c) 2012 __AppSmith__. All rights reserved.
//

#import "CCViewController.h"
#import "SuspicionViewController.h"


const NSUInteger kNumberOfPlayers = 4;
const CGPoint kSuspectBlockOrigin = { 423.5, 279 };
const CGPoint kWeaponBlockOrigin = { 423.5, 494 };
const CGPoint kRoomBlockOrigin = { 423.5, 708 };
const CGSize kButtonSize = { 23, 25 };

@interface CCViewController ()

@property (strong, nonatomic) NSDictionary *murderContext;
@property (strong, nonatomic) NSArray *suspects;
@property (strong, nonatomic) NSArray *weapons;
@property (strong, nonatomic) NSArray *rooms;

@end

@implementation CCViewController

@synthesize SheetScrollView;
@synthesize suspects = _suspects;
@synthesize weapons = _weapons;
@synthesize rooms = _rooms;
@synthesize murderContext = _murderContext;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (nil != self) 
	{
		_suspects = [NSArray arrayWithObjects:@"Col. Mustard", @"Professor Plum", @"Mr. Green", @"Mrs. Peacock", @"Miss Scarlet", @"Mrs. White", nil];
		_weapons = [NSArray arrayWithObjects:@"Knife", @"Candlestick", @"Revolver", @"Rope", @"Lead Pipe", @"Wrench", nil];
		_rooms = [NSArray arrayWithObjects:@"Hall", @"Lounge", @"Dining Room", @"Kitchen", @"Ball Room", @"Conservatory", @"Billiard Room", @"Library", @"Study", nil];
		_murderContext = [NSDictionary dictionaryWithObjectsAndKeys:_suspects, @"suspects", _weapons, @"weapons", _rooms, @"rooms", nil];
	}
	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Take Turn" style:UIBarButtonItemStylePlain target:self action:@selector(takeTurnButtonPressed)];
	
	SheetScrollView.contentSize = CGSizeMake(320, 1100);

	// Set up the Room buttons.
	CGRect currentButtonFrame = CGRectMake(kRoomBlockOrigin.x, kRoomBlockOrigin.y, kButtonSize.width, kButtonSize.height);
	for (NSUInteger roomNumber = 0; roomNumber < self.rooms.count; roomNumber++)
	{
		for (NSUInteger boxNumber = 0; boxNumber < kNumberOfPlayers; boxNumber++)
		{
			UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
			button.frame = currentButtonFrame;
			[button setImage:[UIImage imageNamed:@"X"] forState:UIControlStateSelected];
			
			[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
			
			[self.view addSubview:button];
			
			currentButtonFrame.origin.x = currentButtonFrame.origin.x + kButtonSize.width;
		}
		
		currentButtonFrame.origin.y = currentButtonFrame.origin.y + kButtonSize.height;
		currentButtonFrame.origin.x = kRoomBlockOrigin.x;
	}
	
	// Set up the Weapon buttons.
	currentButtonFrame = CGRectMake(kWeaponBlockOrigin.x, kWeaponBlockOrigin.y, kButtonSize.width, kButtonSize.height);
	for (NSUInteger weaponNumber = 0; weaponNumber < self.weapons.count; weaponNumber++)
	{
		for (NSUInteger boxNumber = 0; boxNumber < kNumberOfPlayers; boxNumber++)
		{
			UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
			button.frame = currentButtonFrame;
			[button setImage:[UIImage imageNamed:@"X"] forState:UIControlStateSelected];
			
			[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
			
			[self.view addSubview:button];
			
			currentButtonFrame.origin.x = currentButtonFrame.origin.x + kButtonSize.width;
		}
		
		currentButtonFrame.origin.y = currentButtonFrame.origin.y + kButtonSize.height;
		currentButtonFrame.origin.x = kWeaponBlockOrigin.x;
	}
	
	// Set up the Suspect buttons.
	currentButtonFrame = CGRectMake(kSuspectBlockOrigin.x, kSuspectBlockOrigin.y, kButtonSize.width, kButtonSize.height);
	for (NSUInteger suspectNumber = 0; suspectNumber < self.suspects.count; suspectNumber++)
	{
		for (NSUInteger boxNumber = 0; boxNumber < kNumberOfPlayers; boxNumber++)
		{
			UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
			button.frame = currentButtonFrame;
			[button setImage:[UIImage imageNamed:@"X"] forState:UIControlStateSelected];
			
			[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
			
			[self.view addSubview:button];
			
			currentButtonFrame.origin.x = currentButtonFrame.origin.x + kButtonSize.width;
		}
		
		currentButtonFrame.origin.y = currentButtonFrame.origin.y + kButtonSize.height;
		currentButtonFrame.origin.x = kSuspectBlockOrigin.x;
	}
}

- (void)viewDidUnload
{
    [self setSheetScrollView:nil];
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return NO;
		// Keep NO so buttons dont screw up
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"SegueToTurn"])
	{
		SuspicionViewController *viewController = segue.destinationViewController;
		viewController.murderContext = self.murderContext;
	}
}

- (void)buttonPressed:(UIControl *)sender
{
	sender.selected = !sender.selected;
}

- (void)takeTurnButtonPressed
{
	[self performSegueWithIdentifier:@"SegueToTurn" sender:self];
}
@end
