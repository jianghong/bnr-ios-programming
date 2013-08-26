//
//  BNRPopoverBackgroundView.m
//  Homepwner
//
//  Created by Jackson Hong on 2013-08-22.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRPopoverBackgroundView.h"


#define ARROW_HEIGHT 25.0
#define ARROW_BASE 25.0

@implementation BNRPopoverBackgroundView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _borderImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"popover-bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(25.0, 25.0, 25.0, 25.0)]];
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
        
        [self addSubview:_borderImageView];
        [self addSubview:_arrowView];
    }
    return self;
}

- (UIPopoverArrowDirection)arrowDirection {
    return _arrowDirection;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection {
    _arrowDirection = arrowDirection;
    [self setNeedsLayout];
}

- (CGFloat)arrowOffset {
    return _arrowOffset;
}

- (void)setArrowOffset:(CGFloat)arrowOffset {
    _arrowOffset = arrowOffset;
    [self setNeedsLayout];
}

+ (CGFloat)arrowBase {
    return 21.0;
}

+ (CGFloat)arrowHeight {
    return 34.0;
}

+ (UIEdgeInsets)contentViewInsets {
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat _height = self.frame.size.height;
    CGFloat _width = self.frame.size.width;
    CGFloat _left = 0.0;
    CGFloat _top = 0.0;
    CGFloat _coordinate = 0.0;
    CGAffineTransform _rotation = CGAffineTransformIdentity;
    
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
            _top += ARROW_HEIGHT;
            _height -= ARROW_HEIGHT;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            _arrowView.frame = CGRectMake(_coordinate, 0, ARROW_BASE, ARROW_HEIGHT);
            break;
            
            
        case UIPopoverArrowDirectionDown:
            _height -= ARROW_HEIGHT;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            _arrowView.frame = CGRectMake(_coordinate, _height, ARROW_BASE, ARROW_HEIGHT);
            _rotation = CGAffineTransformMakeRotation( M_PI );
            break;
            
        case UIPopoverArrowDirectionLeft:
            _left += ARROW_BASE;
            _width -= ARROW_BASE;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset) - (ARROW_HEIGHT/2);
            _arrowView.frame = CGRectMake(0, _coordinate, ARROW_BASE, ARROW_HEIGHT);
            _rotation = CGAffineTransformMakeRotation( -M_PI_2 );
            break;
            
        case UIPopoverArrowDirectionRight:
            _width -= ARROW_BASE;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset)- (ARROW_HEIGHT/2);
            _arrowView.frame = CGRectMake(_width, _coordinate, ARROW_BASE, ARROW_HEIGHT);
            _rotation = CGAffineTransformMakeRotation( M_PI_2 );
            
            break;
    }
    
    _borderImageView.frame = CGRectMake(_left, _top, _width, _height);
    
    [_arrowView setTransform:_rotation];
    
}

@end
