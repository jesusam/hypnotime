//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Jesus Morales on 5/14/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    __weak IBOutlet UILabel *timeLabel;
}
-(IBAction)showCurrentTime:(id)sender;
@end
