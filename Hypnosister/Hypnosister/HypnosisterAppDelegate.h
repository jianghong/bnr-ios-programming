//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Jackson Hong on 2013-08-07.
//  Copyright (c) 2013 Pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisView *view;
}

@property (strong, nonatomic) UIWindow *window;

- (void)colorChange:(id)sender;

@end
