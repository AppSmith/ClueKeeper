//
//  SuspicionViewController.h
//  Clue Ceeper
//
//  Created by Dana Smith on 4/5/12.
//  Copyright (c) 2012 __AppSmith__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuspicionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSDictionary *gameContext;
@property (strong, nonatomic) IBOutlet UIPickerView *namePicker;
@property (strong, nonatomic) IBOutlet UILabel *suspicionText;
@property (strong, nonatomic) IBOutlet UILabel *showText;

@end
