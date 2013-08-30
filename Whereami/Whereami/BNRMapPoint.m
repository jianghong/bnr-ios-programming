//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Jackson on 2013-08-06.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate, title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    
    return self;
}

- (id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:title forKey:@"title"];
    [aCoder encodeDouble:coordinate.latitude forKey:@"lat"];
    [aCoder encodeDouble:coordinate.longitude forKey:@"long"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        [self setTitle:[aDecoder decodeObjectForKey:@"title"]];
        [self
         setCoordinate:CLLocationCoordinate2DMake([aDecoder decodeDoubleForKey:@"lat"],
                                                  [aDecoder decodeDoubleForKey:@"long"])];
    }
    
    return self;
}

@end
