//
//  BNRMapPointStore.m
//  Whereami
//
//  Created by Jackson Hong on 2013-08-30.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRMapPointStore.h"

@implementation BNRMapPointStore

- (id)init {
    self = [super init];
    if (self) {
        if (!allPoints) {
            allPoints = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

+ (BNRMapPointStore *)sharedStore {
    static BNRMapPointStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    
    return sharedStore;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedStore];
}

@end
