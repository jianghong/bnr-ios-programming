//
//  BNRContainer.h
//  RandomPossessions
//
//  Created by Jackson on 2013-08-04.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *subitems;
}

- (id)initWithContainerName:(NSString *)name
             valueInDollars:(int)value
               serialNumber:(NSString *)sNumber
              arraySubitems:(NSMutableArray *)subitemsArray;

- (void)setSubitems:(NSMutableArray *) a;
- (NSMutableArray *)subitems;

- (int)valueInDollars;

@end
