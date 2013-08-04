//
//  BNRContainer.m
//  RandomPossessions
//
//  Created by Jackson on 2013-08-04.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (id)initWithContainerName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber arraySubitems:(NSMutableArray *)subitemsArray
{
    self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber];
    
    if (self) {
        [self setSubitems:subitemsArray];
    }
    
    return self;
}

- (id) init
{
    return [self initWithContainerName:@"Container" valueInDollars:0 serialNumber:@"" arraySubitems:[[NSMutableArray alloc] init]];
}

- (void)setSubitems:(NSMutableArray *)a
{
    subitems = a;
}

- (NSMutableArray *)subitems
{
    return subitems;
}

- (int) valueInDollars
{
    int sum = 0;
    
    // iterate through subitems and sum up value of each item
    for (int i=0; i < [subitems count]; i++)
    {
        sum += [[subitems objectAtIndex:i] valueInDollars];
    }
    
    return sum;
}

- (NSString *) description
{
   NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Total Worth $%d, recorded on %@. Subitems: %@",
     itemName, serialNumber, self.valueInDollars, dateCreated, subitems];
    
    return descriptionString;
}
@end
