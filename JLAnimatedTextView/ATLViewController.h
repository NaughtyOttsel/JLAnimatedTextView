//
//  ATLViewController.h
//  AnimatedTextLabel
//
//  Created by James Lee on 07/12/2011.
//  Copyright (c) 2011 Touch Device Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLAnimatedTextView.h"

@interface ATLViewController : UIViewController <UITextViewDelegate, JLAnimatedTextViewDelegate>
{
    NSString *theTextString;
    int index;
}
@property (strong, nonatomic) IBOutlet JLAnimatedTextView *theTextLabel;
-(IBAction)go:(UIButton *)sender;
@end
