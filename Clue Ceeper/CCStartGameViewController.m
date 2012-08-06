//
//  CCStartGameViewController.m
//  Clue Ceeper
//
//  Created by Dana Smith on 8/5/12.
//  Copyright (c) 2012 __AppSmith__. All rights reserved.
//

#import "CCStartGameViewController.h"
#import "CCViewController.h"

@interface CCStartGameViewController ()

@end

@implementation CCStartGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)startGameButtonPressed
{	
	[self performSegueWithIdentifier:@"SegueToChecklist" sender:self];
}

@end
