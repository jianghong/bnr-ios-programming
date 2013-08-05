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
        
       
        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"Backpack"];
        
        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];
        
        [backpack setContainedItem:calculator];
        
        // Destroy the array pointed to by items
        NSLog(@"Setting items to nil...");
        
        backpack = nil;
        NSLog(@"Container: %@", [calculator container]);
        calculator = nil;
        
    }
    return 0;
}

