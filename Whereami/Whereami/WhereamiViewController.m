//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Jackson on 2013-08-04.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        
        [locationManager setDelegate:self];
        
        // And we want it to be as accurate as possible
        // regardless of how much time/power it takes
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    // How many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the device
    // first, you don't want that data in this case.
    // If this location was made more than 3 minutes ago, ignore it
    if (t < -180) {
        // this is cached data, you don't want it, keep looking
        return;
    }
    
    [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager
didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)dealloc
{
    // Tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Create an instance of BNRMapPoint with the current data
    
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
   
    NSDictionary *mpdict = [self createMapPointDicionary:mp];
    
    // save map point
    [self saveMapPoint:mpdict];
    
    // Add it to the map view
    [worldView addAnnotation:mp];
    
    // Zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

- (BOOL)saveMapPoint:(NSDictionary *) mp {
    NSLog(@"Save map point");
    
    // returns success or failure
    NSString *path = [self itemArchivePath:mp];
    
    return [NSKeyedArchiver archiveRootObject:mp toFile:path];
    
}

- (NSString *)itemArchivePath:(NSDictionary *)mp {
    NSArray *documentDirectories =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    // Create unique name for point
    NSString *unique = [NSString stringWithFormat:@"%@(%@, %@)",
                        mp[@"mapTitle"],
                        mp[@"mapLat"],
                        mp[@"mapLong"]];
    NSString *ddpath = [documentDirectory stringByAppendingPathComponent:@"map-point:"];
    
    
    return [NSString stringWithFormat:@"%@%@", ddpath, unique];
    
}

- (NSDictionary *)createMapPointDicionary:(BNRMapPoint *) mp {
    NSString *title = [mp title];
    int latitude = [mp coordinate].latitude;
    int longitude = [mp coordinate].longitude;
    
    NSDictionary *result = @{@"mapTitle": title,
                             @"mapLat": [NSNumber numberWithInt:latitude],
                             @"mapLong": [NSNumber numberWithInt:longitude]};
    
    return result;
}
@end
