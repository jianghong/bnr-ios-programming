//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Jackson on 2013-08-10.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"


@implementation BNRItemStore

- (id)init
{
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] init];
        
        NSMutableArray *lessThanFifty = [[NSMutableArray alloc] init];
        NSMutableArray *greaterThanFifty = [[NSMutableArray alloc] init];
        
        [allItems addObject:lessThanFifty];
        [allItems addObject:greaterThanFifty];
        
    }
    
    return self;
}
+ (BNRItemStore *)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    
    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (NSArray *)allItems
{
    return allItems;
}

- (BNRItem *)createItem
{
    BNRItem *p = [BNRItem randomItem];
    
    if (p.valueInDollars <= 50) {
        [[allItems objectAtIndex:0] addObject:p];
    } else {
        [[allItems objectAtIndex:1] addObject:p];
    }
    
    return p;
}
@end
