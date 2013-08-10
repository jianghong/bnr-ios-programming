//
//  RotationAppDelegate.h
//  HeavyRotation
//
//  Created by Jackson on 2013-08-08.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotationAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)orientationChanged:(NSNotification *)note;
- (void)faceDetected:(NSNotification *)note;

@end
