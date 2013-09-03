//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Jackson on 2013-08-10.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"

@interface ItemsViewController : UITableViewController <UIPopoverControllerDelegate>
{
    UIPopoverController *imagePopover;
}

- (IBAction)addNewItem:(id)sender;

@end
