//
//  main.m
//  RandomPossessions
//
//  Created by Jackson on 2013-08-04.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRItem *p = [BNRItem randomItem];
            [items addObject:p];
        }
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
       
        BNRItem *novalue = [[BNRItem alloc] initWithItemName:@"Love" serialNumber:@"<3"];
        NSLog(@"This item has no value: %@", novalue);
        
        // Destroy the array pointed to by items
        items = nil;
        
    }
    return 0;
}

