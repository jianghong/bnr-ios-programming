//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Jackson on 2013-08-04.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    
}

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;

@end
