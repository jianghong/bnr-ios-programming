//
//  DatePickerViewController.h
//  Homepwner
//
//  Created by Jackson on 2013-08-13.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DatePickerViewController : UIViewController
{
    __weak IBOutlet UIDatePicker *datePicker;
}

@property (nonatomic, strong)BNRItem *item;

@end
