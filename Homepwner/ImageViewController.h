//
//  ImageViewController.h
//  Homepwner
//
//  Created by Jackson Hong on 2013-09-03.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIImageView *imageView;
    
}

@property (nonatomic, strong) UIImage *image;

@end
