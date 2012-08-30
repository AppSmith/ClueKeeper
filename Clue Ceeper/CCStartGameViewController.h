//
//  CCStartGameViewController.h
//  Clue Ceeper
//
//  Created by Dana Smith on 8/5/12.
//  Copyright (c) 2012 __AppSmith__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCStartGameViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *player1TextBox;
@property (strong, nonatomic) IBOutlet UISegmentedControl *player1SegmentControl;
@property (strong, nonatomic) IBOutlet UITextField *player2TextBox;
@property (strong, nonatomic) IBOutlet UISegmentedControl *player2SegmentControl;
@property (strong, nonatomic) IBOutlet UITextField *player3TextBox;
@property (strong, nonatomic) IBOutlet UISegmentedControl *player3SegmentControl;
@property (strong, nonatomic) IBOutlet UITextField *player4TextBox;
@property (strong, nonatomic) IBOutlet UISegmentedControl *player4SegmentControl;
@property (strong, nonatomic) IBOutlet UITextField *player5TextBox;
@property (strong, nonatomic) IBOutlet UISegmentedControl *player5SegmentControl;
@property (strong, nonatomic) IBOutlet UITextField *player6TextBox;
@property (strong, nonatomic) IBOutlet UISegmentedControl *player6SegmentControl;

- (IBAction)segmentValueChanged:(id)sender;
@end
