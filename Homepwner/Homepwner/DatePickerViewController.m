//
//  DatePickerViewController.m
//  Homepwner
//
//  Created by Jackson on 2013-08-13.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "DatePickerViewController.h"
#import "BNRItem.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

@synthesize item;

- (void)setItem:(BNRItem *)i
{
    item = i;
    [[self navigationItem] setTitle:[NSString stringWithFormat:@"%@'s date",[item itemName]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [datePicker setDate:[item dateCreated] animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // save date changes
    [item setDateCreated:[datePicker date]];
}

@end
