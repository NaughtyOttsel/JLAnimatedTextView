//
//  JLAnimatedTextView.h
//  AnimatedTextLabel
//
//  Created by James Lee on 08/12/2011.
//  Copyright (c) 2011 Touch Device Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JLAnimatedTextViewDelegate;

@interface JLAnimatedTextView : UITextView
{
    NSTimer *updatingTimer; //The Timer used to update the text, the speed is set later on either in an init method, or through the property.
    
    int index; //The current character that the textView should add to its own text.
    
    id <JLAnimatedTextViewDelegate> animatedTextDelegate; //The delegate to send messages to the owner of the view.
}
@property (nonatomic, strong) NSString *selfUpdatingString; //The string the view updates itself with.

@property (nonatomic, assign) float speed; //The speed the timer will update itself, as can be set by the owner.

@property (nonatomic, strong) id <JLAnimatedTextViewDelegate> animatedTextDelegate; //The delegate

-initWithSelfUpdatingText:(NSString *)text andTextSpeed:(float)textSpeed; //The init method if the view is created programatically.

-(void)start; //Start the animation.
@end

@protocol JLAnimatedTextViewDelegate <NSObject>

@optional

-(void)textViewDidRecieveTap:(JLAnimatedTextView *)textView; //Called if the delegate responds to the method to allow the delegate to do whatever it wants with the textview. E.g. Removing the textView from the superview.
-(void)textViewDidRecieveDoubleTap:(JLAnimatedTextView *)textView; //Again called if the delegate responds to the method to allow the delegate to do whatever it wants.

@end
