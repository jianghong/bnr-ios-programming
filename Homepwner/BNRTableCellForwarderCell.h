//
//  BNRTableCellForwarderCell.h
//  Homepwner
//
//  Created by Jackson on 2013-09-05.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRTableCellForwarderCell : UITableViewCell

- (void)forwardActionMessageToController: (SEL)selector, ...;

@end
