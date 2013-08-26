//
//  BNRPopoverBackgroundView.h
//  Homepwner
//
//  Created by Jackson Hong on 2013-08-22.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRPopoverBackgroundView : UIPopoverBackgroundView
{
    UIImageView *_borderImageView;
    UIImageView *_arrowView;
    CGFloat _arrowOffset;
    UIPopoverArrowDirection _arrowDirection;
}
+ (UIEdgeInsets)contentViewInsets;
+ (CGFloat)arrowHeight;
+ (CGFloat)arrowBase;

@end
