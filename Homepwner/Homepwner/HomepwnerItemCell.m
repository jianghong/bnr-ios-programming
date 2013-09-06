//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Jackson Hong on 2013-09-03.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "HomepwnerItemCell.h"

@implementation HomepwnerItemCell

@synthesize controller, tableView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showImage:(id)sender {
    // Get this name of this method, "showImage:"
    NSString *selector = NSStringFromSelector(_cmd);
    // selector is now "showImage:atIndexPath:"
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    
    // Prepare a selector from this string
    SEL newSelector = NSSelectorFromString(selector);
    
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    
    if (indexPath) {
        if ([[self controller] respondsToSelector:newSelector]) {
            // Ignore warning for this line - may or may not appear, doesn't matter
            [[self controller] performSelector:newSelector
                                    withObject:sender
                                    withObject:indexPath];
            [[self controller] perform]
        }
    }
}
@end
