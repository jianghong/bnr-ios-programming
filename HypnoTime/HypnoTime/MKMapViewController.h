//
//  BNRMapViewController.h
//  HypnoTime
//
//  Created by Jackson Hong on 2013-08-08.
//  Copyright (c) 2013 Pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MKMapViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *mapView;
}


@end
