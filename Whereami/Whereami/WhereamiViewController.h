//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Jackson on 2013-08-04.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@end
