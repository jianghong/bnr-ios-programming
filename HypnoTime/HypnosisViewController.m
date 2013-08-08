//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Jackson Hong on 2013-08-08.
//  Copyright (c) 2013 Pandabox. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the superclass's designated initializer
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Hypnosis"];
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        [tbi setImage:i];
    }
    
    return self;
}
- (void)loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    NSArray *colors = [[NSArray alloc] initWithObjects:@"Light Gray", @"Blue", @"Yellow", nil];
    UISegmentedControl *colorChoices = [[UISegmentedControl alloc] initWithItems:colors];
    [colorChoices setSelectedSegmentIndex:0];
    [colorChoices addTarget:v action:@selector(changeCircleColor:) forControlEvents:UIControlEventValueChanged];
    
    [v addSubview:colorChoices];
    // Set it as *the* view of this view controller
    [self setView:v];
}

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"HypnosisViewController loaded its view.");
}
@end
