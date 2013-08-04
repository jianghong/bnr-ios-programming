//
//  main.m
//  RandomPossessions
//
//  Created by Jackson on 2013-08-04.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        NSMutableArray *items2 = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRItem *p = [BNRItem randomItem];
            [items addObject:p];
            [items2 addObject:p];
        }
        
//        for (BNRItem *item in items) {
//            NSLog(@"%@", item);
//        }
       
        BNRContainer *c1 = [[BNRContainer alloc] initWithContainerName:@"Container 1" valueInDollars:10 serialNumber:@"abc" arraySubitems:items];
       
        // add container 1 to items2 array
        [items2 addObject:c1];
        
        BNRContainer *c2 = [[BNRContainer alloc] initWithContainerName:@"Container 2" valueInDollars:5 serialNumber:@"bca" arraySubitems:items2];
        
        NSLog(@"%@", [c1 description]);
        NSLog(@"%@", [c2 description]);
        
        // Destroy the array pointed to by items
        items = nil;
        
    }
    return 0;
}

