//
//  BNRMapPointStore.m
//  Whereami
//
//  Created by Jackson Hong on 2013-08-30.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRMapPointStore.h"
#import "BNRMapPoint.h"

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

- (NSArray *)allPoints {
    return allPoints;
}

- (BNRMapPoint *)createPointWithCoord:(CLLocationCoordinate2D)c title:(NSString *)t; {
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:c title:t];
    [allPoints addObject:mp];
    
    return mp;
}

- (NSString *)itemArchivePath {
    NSArray *documentDirectories =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"mappoints.archive"];
    
    
}

- (BOOL)saveChanges {
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:allPoints toFile:path];
}

@end
