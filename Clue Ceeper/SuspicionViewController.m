//
//  SuspicionViewController.m
//  Clue Ceeper
//
//  Created by Dana Smith on 4/5/12.
//  Copyright (c) 2012 __AppSmith__. All rights reserved.
//

#import "SuspicionViewController.h"

@interface SuspicionViewController ()

@property (nonatomic, strong) NSArray *suspects;
@property (nonatomic, strong) NSArray *weapons;
@property (nonatomic, strong) NSArray *rooms;

@end

@implementation SuspicionViewController

@synthesize gameContext = _gameContext;
@synthesize suspects = _suspects;
@synthesize weapons = _weapons;
@synthesize rooms = _rooms;


- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		_suspects = [NSArray arrayWithObject:@"None"];
		_weapons = [NSArray arrayWithObject:@"None"];
		_rooms = [NSArray arrayWithObject:@"None"];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}

- (NSArray *)suspects
{
	return [_suspects arrayByAddingObjectsFromArray:[self.gameContext valueForKey:@"suspects"]];
}
- (NSArray *)weapons
{
	return [_weapons arrayByAddingObjectsFromArray:[self.gameContext valueForKey:@"weapons"]];
}
- (NSArray *)rooms
{
	return [_rooms arrayByAddingObjectsFromArray:[self.gameContext valueForKey:@"rooms"]];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	// One component for suspects, one for weapons, and one for rooms.
	return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	NSInteger numberOfRows = 0;
	
	if (component == 0)
	{
		// Number of suspects
		numberOfRows = self.suspects.count;
	}
	else if (component == 1)
	{
		// Number of weapons
		numberOfRows = self.weapons.count;
	}
	else if (component == 2)
	{
		// Number of rooms
		numberOfRows = self.rooms.count;
	}
	
	return numberOfRows;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return 25;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return 200;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSString *title;
	if (component == 0)
	{
		// Number of suspects
		title = [self.suspects objectAtIndex:row];
	}
	else if (component == 1)
	{
		// Number of weapons
		title = [self.weapons objectAtIndex:row];
	}
	else if (component == 2)
	{
		// Number of rooms
		title = [self.rooms objectAtIndex:row];
	}
	
	return title;
}

@end
