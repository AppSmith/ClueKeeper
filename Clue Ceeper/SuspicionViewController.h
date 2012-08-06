//
//  SuspicionViewController.h
//  Clue Ceeper
//
//  Created by Dana Smith on 4/5/12.
//  Copyright (c) 2012 __AppSmith__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuspicionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSDictionary *murderContext;

@end
