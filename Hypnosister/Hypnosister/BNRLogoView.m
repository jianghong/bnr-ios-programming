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
    UIImage *BNRLogo = [[UIImage alloc] initWithContentsOfFile:@"/Users/Jackson/Dropbox/iOS-Dev/BNR/Hypnosister/Hypnosister/Icon.png"];
    CGFloat radius = [BNRLogo size].width / 2.0;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // set up circle path for contextclip
    CGContextAddArc(ctx, [BNRLogo size].width / 2.0, [BNRLogo size].height / 2.0, radius, 0.0, M_PI * 2, YES);
    CGContextClip(ctx);
    // draw image with context clip
    [BNRLogo drawInRect:rect];
    
    // draw the black outline around logo
    CGContextSetLineWidth(ctx, 1);
    [[UIColor blackColor] setStroke];
    CGContextAddArc(ctx, [BNRLogo size].width / 2.0, [BNRLogo size].height / 2.0, radius, 0.0, M_PI * 2, YES);
    CGContextStrokePath(ctx);
    
}
@end
