//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Jackson on 2013-08-10.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@implementation ItemsViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5 ; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    
    UIImage *backgroundImage = [[UIImage alloc] initWithContentsOfFile:@"/Users/Jackson/Dropbox/iOS-Dev/BNR/Homepwner/Homepwner/blueprint.jpg"];
    UIImageView *imView = [[UIImageView alloc] initWithImage:backgroundImage];
    [[self tableView] setBackgroundView:imView];
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check for a resuable cell first, use that if it exists
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    // If there is not resuable cell of this type, create a new one
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    
    // Set the text of the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    BNRItem *p = [[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:20.0]];
    [[cell textLabel] setText:[p description]];
    
    if ([indexPath row] == [[[BNRItemStore sharedStore] allItems] count] - 1) {
        [[cell textLabel] setFont:[UIFont systemFontOfSize:18.0]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == [[[BNRItemStore sharedStore] allItems] count] - 1) {
        return 44.0;
    }
    return 60.0;
}
@end
