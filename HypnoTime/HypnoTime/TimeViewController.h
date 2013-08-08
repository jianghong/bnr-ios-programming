//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Jackson Hong on 2013-08-08.
//  Copyright (c) 2013 Pandabox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
   __weak IBOutlet UILabel *timeLabel;
}

- (IBAction)showCurrentTime:(id)sender;

@end
