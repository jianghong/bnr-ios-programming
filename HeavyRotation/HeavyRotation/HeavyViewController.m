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


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGRect bounds = [[self view] bounds];
    
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
        // get the right hand side center point to put the button
        
        CGPoint rightCenter = CGPointMake(bounds.size.width - ([[self button] bounds].size.width / 2), bounds.size.height /2);
        
        [[self button] setCenter:rightCenter];
    }
    
    
}
@end
