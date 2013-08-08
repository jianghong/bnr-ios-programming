//
//  BNRLogoView.m
//  Hypnosister
//
//  Created by Jackson on 2013-08-07.
//  Copyright (c) 2013 Pandabox. All rights reserved.
//

#import "BNRLogoView.h"

@implementation BNRLogoView

- (void)drawRect:(CGRect)rect
{
    UIImage *BNRLogo = [[UIImage alloc] initWithContentsOfFile:@"/Users/Jackson/Dropbox/iOS-Dev/BNR/Hypnosister/Hypnosister/Icon.png"];
    [BNRLogo drawInRect:rect];

}
@end
