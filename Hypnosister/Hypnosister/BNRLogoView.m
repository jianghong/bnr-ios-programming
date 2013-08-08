//
//  BNRLogoView.m
//  Hypnosister
//
//  Created by Jackson on 2013-08-07.
//  Copyright (c) 2013 Pandabox. All rights reserved.
//

#import "BNRLogoView.h"

@implementation BNRLogoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setClipsToBounds:YES];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = [self bounds];
    UIImage *BNRLogo = [[UIImage alloc] initWithContentsOfFile:@"/Users/Jackson/Dropbox/iOS-Dev/BNR/Hypnosister/Hypnosister/Icon.png"];
    CGFloat radius = [BNRLogo size].width / 2.0;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // set up circle path for contextclip
    CGContextAddArc(ctx, [BNRLogo size].width / 2.0, [BNRLogo size].height / 2.0, radius, 0.0, M_PI * 2, YES);
    CGContextClip(ctx);
    
    // draw image with context clip
    [BNRLogo drawInRect:rect];
    
    // draw the black outline around logo with shadow
    CGContextSetLineWidth(ctx, 1);
    CGSize offset = CGSizeMake(-1, -1);
    CGContextSetShadow(ctx, offset, 2.0);
    [[UIColor blackColor] setStroke];
    CGContextAddArc(ctx, [BNRLogo size].width / 2.0, [BNRLogo size].height / 2.0, radius, 0.0, M_PI * 2, YES);
    CGContextStrokePath(ctx);
   
    // create gradient
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // up color
    UIColor *upColor = [UIColor blueColor];
    const CGFloat *upColorComponents = CGColorGetComponents(upColor.CGColor);
    
    // down color
    UIColor *downColor = [UIColor clearColor];
    const CGFloat *downColorComponents = CGColorGetComponents(downColor.CGColor);
    
    const CGFloat colorComponents[8] = {
        // up color
        upColorComponents[0],
        upColorComponents[1],
        upColorComponents[2],
        upColorComponents[3],
        // down color
        downColorComponents[0],
        downColorComponents[1],
        downColorComponents[2],
        downColorComponents[3]
    };
    
    const CGFloat colorIndices[2] = {
        0.0f,  1.0f
    };
    
    // num of colors
    const unsigned int numColors = 2;
    
    // create gradient
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,
                                                                 colorComponents,
                                                                 colorIndices,
                                                                 numColors);

    CGPoint startPoint = bounds.origin, endPoint = bounds.origin;
    endPoint.y+=bounds.size.height/2;
    
    int options = 0;
    options = kCGGradientDrawsAfterEndLocation | kCGGradientDrawsBeforeStartLocation;
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, options);
    
    /* release */
    CGColorSpaceRelease(colorSpace);
}
@end
