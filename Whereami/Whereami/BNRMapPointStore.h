//
//  BNRMapPointStore.h
//  Whereami
//
//  Created by Jackson Hong on 2013-08-30.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class BNRMapPoint;

@interface BNRMapPointStore : NSObject {
    NSMutableArray *allPoints;
}

+ (BNRMapPointStore *)sharedStore;

- (NSArray *)allPoints;
- (BNRMapPoint *)createPointWithCoord:(CLLocationCoordinate2D)c title:(NSString *)t;
- (NSString *)itemArchivePath;
- (BOOL)saveChanges;

@end
