//
//  DetailViewController.h
//  Homepwner
//
//  Created by Jackson on 2013-08-12.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController
<UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,
UIPopoverControllerDelegate>
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIImageView *imageView;
    
    UIPopoverController *imagePickerPopover;
}
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)takePicture:(id)sender;
- (id)initForNewItem:(BOOL)isNew;

@property (nonatomic, strong) BNRItem *item;
@property (nonatomic, copy) void (^dismissBlock) (void);

@end
