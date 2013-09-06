//
//  BNRTableCellForwarderCell.m
//  Homepwner
//
//  Created by Jackson on 2013-09-05.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRTableCellForwarderCell.h"

@implementation BNRTableCellForwarderCell

- (void)forwardActionMessageToController:(SEL)selectorToForward, ... {
    
    NSMutableArray *arguments=[[NSMutableArray alloc]initWithArray:nil];
    id eachObject;
    va_list argumentList;
    if (selectorToForward)
    {
        va_start(argumentList, selectorToForward);
        while ((eachObject = va_arg(argumentList, id)))
        {
            [arguments addObject: eachObject];
        }
        va_end(argumentList);
    }
    NSLog(@"%@",arguments);
}

@end
