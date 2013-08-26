//
//  BNRPopoverBackgroundView.h
//  Homepwner
//
//  Created by Jackson Hong on 2013-08-22.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRPopoverBackgroundView : UIPopoverBackgroundView
+ (UIEdgeInsets)contentViewInsets;
+ (CGFloat)arrowHeight;
+ (CGFloat)arrowBase;
+ (BOOL)wantsDefaultContentAppearance;

@property (nonatomic, readwrite) CGFloat arrowOffset;
@property (nonatomic, readwrite) UIPopoverArrowDirection arrowDirection;
@end
