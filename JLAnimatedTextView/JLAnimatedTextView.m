//
//  JLAnimatedTextView.m
//  AnimatedTextLabel
//
//  Created by James Lee on 08/12/2011.
//  Copyright (c) 2011 Touch Device Company. All rights reserved.
//

#import "JLAnimatedTextView.h"

@implementation JLAnimatedTextView
@synthesize selfUpdatingString, speed, animatedTextDelegate;

-(id)initWithFrame:(CGRect)frame textToDisplay:(NSString *)text andTextSpeed:(float)textSpeed
{
    if (self = [super initWithFrame:frame])
    {
        //Set the properties to the variables set in the calling of the method, set the index to 0.
        
        self.selfUpdatingString = text;
        
        self.speed = textSpeed;
        
        index = 0;
        
        //Make sure that the textView is not editable, we don't want the user to edit the text, do we?
        self.editable = NO;
    }
    
    return self;
}

-(void)addSomeText:(NSTimer *)timer
{
    //First check whether all the text has not been displayed.
    if(![self.text isEqualToString:self.selfUpdatingString])
    {
        //Create a range
        NSRange range;
        
        //Set the range properties to the index (character to display) and the location as 1, this could later be changed to a property of the textView if it is seen as being handy.
        range.location = index;
        range.length = 1;
        
        //Then add the character at the index point from the updatingString to the textView's own text.
        self.text = [self.text stringByAppendingString:[self.selfUpdatingString substringWithRange:range]];
        
        //Up the index ready.
        index++;
        
        //Then make sure the user see's the change.
        [self scrollRangeToVisible:NSMakeRange([self.text length], 0)];
    }
    else
    {
        //If all the text has been displayed, stop the timer.
        [timer invalidate];
    }

}

-(void)tapGestureFoundWithTaps:(int)taps
{
    //Decide on the number of taps what action to check.
    switch (taps)
    {
        case 1:
    //Check the delegate responds to the method
    if ([self.animatedTextDelegate respondsToSelector:@selector(textViewDidRecieveTap:)])
        {
            //If we do, call the delegate method
            [self.animatedTextDelegate textViewDidRecieveTap:self];
        }
        break;
        
        case 2:
    //Again check if the delegate responds to the method
    if ([self.animatedTextDelegate respondsToSelector:@selector(textViewDidRecieveDoubleTap:)])
            {
                //And again, call the method if the delegate does
                [self.animatedTextDelegate textViewDidRecieveDoubleTap:self];
            }
        break;
        
        default:
            break;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Get a touch
    UITouch *touch = [[event allTouches]anyObject];
    
    //Check if the count is more than 0
    if (touch.tapCount == 1)
    {
    //Call the method if it is more than 0
    [self tapGestureFoundWithTaps:touch.tapCount];
    }
    else if (touch.tapCount == 2)
    {
        [self tapGestureFoundWithTaps:touch.tapCount];
    }
}

-(void)start
{

    //Check if the speed is not more than 0
    if (!self.speed > 0)
    {
        //If it isn't, set the speed to a default value.
        self.speed = 0.02;
    }
    
    //Call the timer to start
    updatingTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(addSomeText:) userInfo:nil repeats:YES];
}
@end
