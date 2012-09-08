//
//  CCStartGameViewController.m
//  Clue Ceeper
//
//  Created by Dana Smith on 8/5/12.
//  Copyright (c) 2012 __AppSmith__. All rights reserved.
//

#import "CCStartGameViewController.h"
#import "CCViewController.h"

const NSUInteger kSegmentControlsStart = 500;
const NSUInteger kSegmentControlsEnd = 505;
const NSUInteger kTextBoxStart = 600;
const NSUInteger kTextBoxEnd = 605;

@interface CCStartGameViewController ()

@property (nonatomic, assign) NSUInteger meTag;
@property (strong, nonatomic) NSMutableDictionary *gameContext;
@property (strong, nonatomic) NSArray *suspects;
@property (strong, nonatomic) NSArray *weapons;
@property (strong, nonatomic) NSArray *rooms;

@end

@implementation CCStartGameViewController
@synthesize player1TextBox = _player1TextBox;
@synthesize player1SegmentControl = _player1SegmentControl;
@synthesize player2TextBox = _player2TextBox;
@synthesize player2SegmentControl = _player2SegmentControl;
@synthesize player3TextBox = _player3TextBox;
@synthesize player3SegmentControl = _player3SegmentControl;
@synthesize player4TextBox = _player4TextBox;
@synthesize player4SegmentControl = _player4SegmentControl;
@synthesize player5TextBox = _player5TextBox;
@synthesize player5SegmentControl = _player5SegmentControl;
@synthesize player6TextBox = _player6TextBox;
@synthesize player6SegmentControl = _player6SegmentControl;
@synthesize meTag = _meTag;
@synthesize suspects = _suspects;
@synthesize weapons = _weapons;
@synthesize rooms = _rooms;
@synthesize gameContext = _gameContext;

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (nil != self) 
	{
		_suspects = [NSArray arrayWithObjects:@"Col. Mustard", @"Professor Plum", @"Mr. Green", @"Mrs. Peacock", @"Miss Scarlet", @"Mrs. White", nil];
		_weapons = [NSArray arrayWithObjects:@"Knife", @"Candlestick", @"Revolver", @"Rope", @"Lead Pipe", @"Wrench", nil];
		_rooms = [NSArray arrayWithObjects:@"Hall", @"Lounge", @"Dining Room", @"Kitchen", @"Ball Room", @"Conservatory", @"Billiard Room", @"Library", @"Study", nil];
		_gameContext = [NSMutableDictionary dictionaryWithObjectsAndKeys:_suspects, @"suspects", _weapons, @"weapons", _rooms, @"rooms", nil];
		_meTag = kSegmentControlsStart;
	}
	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Start Game" style:(UIBarButtonItemStylePlain) target:self action:@selector(startGameButtonPressed)];
}

- (void)viewDidUnload
{
	[self setPlayer1TextBox:nil];
	[self setPlayer2TextBox:nil];
	[self setPlayer3TextBox:nil];
	[self setPlayer4TextBox:nil];
	[self setPlayer5TextBox:nil];
	[self setPlayer6TextBox:nil];
	[self setPlayer1SegmentControl:nil];
	[self setPlayer2SegmentControl:nil];
	[self setPlayer3SegmentControl:nil];
	[self setPlayer4SegmentControl:nil];
	[self setPlayer5SegmentControl:nil];
	[self setPlayer6SegmentControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	CCViewController *next = segue.destinationViewController;
	NSMutableArray *playerList = [NSMutableArray arrayWithCapacity:6];
	
	for (NSUInteger index = 0; index <= kTextBoxEnd - kTextBoxStart; index++) {
		UISegmentedControl *segment = (UISegmentedControl *)[self.view viewWithTag:kSegmentControlsStart + index];
		
		if (segment.selectedSegmentIndex == 0 || segment.selectedSegmentIndex == segment.numberOfSegments - 1)
		{
			UITextField *textbox = (UITextField *)[self.view viewWithTag:kTextBoxStart + index];
			
			if (textbox.text != nil)
			{
				[playerList addObject:textbox.text];
			}
			else
			{
				[playerList addObject:[NSString stringWithFormat:@"Player %i", index + 1]];
			}
		}
	}
	
	[self.gameContext setObject:playerList forKey:@"players"];
	[self.gameContext setObject:[NSNumber numberWithInt:self.meTag - kSegmentControlsStart] forKey:@"meIndex"];
	next.gameContext = self.gameContext;
}

- (void)startGameButtonPressed
{	
	[self performSegueWithIdentifier:@"SegueToChecklist" sender:self];
}

- (IBAction)segmentValueChanged:(id)sender
{
	UISegmentedControl *control = sender;
	if (control.selectedSegmentIndex == control.numberOfSegments - 1) 
	{
		// Me segment has been selected. Need to turn off the old one and record this new one.
		UISegmentedControl *previousSelection = (UISegmentedControl *)[self.view viewWithTag:self.meTag];
		[previousSelection setSelectedSegmentIndex:0];
		
		self.meTag = control.tag;
	}
	else
	{
		if (control.tag == self.meTag)
		{
			// We've switched 'me' off, so we need to put the first control back to 'me'
			self.meTag = kSegmentControlsStart;
			for (UISegmentedControl *firstControl in self.view.subviews) 
			{
				if (firstControl.tag == kSegmentControlsStart)
				{
					[firstControl setSelectedSegmentIndex:firstControl.numberOfSegments - 1];
				}
			}
		}
	}
}
@end
