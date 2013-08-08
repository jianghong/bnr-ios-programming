//
//  BNRMapViewController.m
//  HypnoTime
//
//  Created by Jackson Hong on 2013-08-08.
//  Copyright (c) 2013 Pandabox. All rights reserved.
//

#import "MKMapViewController.h"

@implementation MKMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Map"];
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:i];
        
    }
    
    return self;
}

@end
