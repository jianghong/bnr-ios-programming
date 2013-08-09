//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Jackson on 2013-08-08.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "HeavyViewController.h"

@interface HeavyViewController ()

@end

@implementation HeavyViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    // Return YES if incoming orientation is Portrait
    // or either of the Landscapes, otherwise, return NO
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
@end
