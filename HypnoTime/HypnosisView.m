//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Jesus Morales on 5/14/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize circleColor = _circleColor;
@synthesize currentColorIndex = _currentColorIndex;

-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    //Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //the radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //the thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    
    //the color of the line should be gray (red/green/blue = 0.6, alpha = 1.0);
    [[self circleColor] setStroke];
// //NEWNEWNEWNEWNEWNEWNEWN
//    NSArray *colorsArray = [NSArray arrayWithObjects:[UIColor redColor],
//                            [UIColor orangeColor],
//                            [UIColor yellowColor],
//                            [UIColor greenColor],
//                            [UIColor blueColor],
//                            [UIColor purpleColor],
//                            [UIColor lightGrayColor],
//                            nil];
//    
//    int currColor = 0;
//    
//    //NEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNWENWENWENWENWE
    //Draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
//        //NEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEW
//        [[colorsArray objectAtIndex:currColor] setStroke];
//        currColor++;
//        if (currColor == [colorsArray count]) {
//            currColor = 0;
//        }
//        //NEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEW
        
        //Add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        
        //Perform drawing instruction; removes path
        CGContextStrokePath(ctx);
    }
    
    //Create a string
    NSString *text = @"You are getting sleepy.";
    
    //Get the font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    //How big is this string when drawn in this font?
    textRect.size = [text sizeWithFont:font];
    
    //Let's put that string in the center of the view
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    //Set the fill color of the current context to black
    [[UIColor blackColor] setFill];
    
    //the shadow will move 4 point to the right and 3 points down from the text
    CGSize offset = CGSizeMake(4, 3);
    
    //The shadow will be dark gray color
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    //Set the shadow of the context with these parameters,
    //all subsequent drawing will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    //Draw the string
    [text drawInRect:textRect withFont:font];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //All HypnosisViews start with a clear background color
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    
    return self;
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSArray *colorsArray = [NSArray arrayWithObjects:[UIColor redColor],
                                                     [UIColor orangeColor],
                                                     [UIColor yellowColor],
                                                     [UIColor greenColor],
                                                     [UIColor blueColor],
                                                     [UIColor purpleColor],
                                                     [UIColor lightGrayColor],
                                                      nil];
    [self setCircleColor:[colorsArray objectAtIndex:_currentColorIndex]];
    _currentColorIndex++;
    if (_currentColorIndex == [colorsArray count])
    {
        _currentColorIndex = 0;
    }
}

@end
