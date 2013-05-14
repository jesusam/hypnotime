//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Jesus Morales on 5/14/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

-(IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [timeLabel setText:[formatter stringFromDate:now]];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //Call the superclass's designated initializer
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    //get a pointer to the application bundle object
    NSBundle *appBundle = [NSBundle mainBundle];
    
    self = [super initWithNibName:@"TimeViewController" bundle:appBundle];
    
    if (self)
    {
        //Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        //Give it a label
        [tbi setTitle:@"Time"];
        
        //Create a UIImage from a file
        //This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        
        //Put that image on the tab bar item
        [tbi setImage:i];
    }
    
    return self;
}

@end
