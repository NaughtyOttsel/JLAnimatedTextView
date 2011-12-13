//
//  ATLViewController.m
//  AnimatedTextLabel
//
//  Created by James Lee on 07/12/2011.
//  Copyright (c) 2011 Touch Device Company. All rights reserved.
//

#import "ATLViewController.h"

@implementation ATLViewController
@synthesize theTextLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    theTextString = [[NSString alloc] initWithString:@"Hello and welcome to the Animated Text Label Test, this is being used to test whether is is possible to have text scrolling along like old school JRPG games. The view builds on top of the usual press to go further. The view will automatically scroll itself. The user can scroll afterwards. The view also allows for control from taps, be it removing the view or any other techniques you may want to use."];
    
    index = 0;
    
    self.theTextLabel.backgroundColor = [UIColor clearColor];
    self.theTextLabel.selfUpdatingString = theTextString;
    self.theTextLabel.speed = 0.02;
    self.theTextLabel.animatedTextDelegate = self;
}

-(IBAction)go:(UIButton *)sender
{
    [self.theTextLabel start];
}

-(void)textViewDidRecieveTap:(JLAnimatedTextView *)textView
{
    NSLog(@"Delegate Method Called");
    [textView removeFromSuperview];
    textView = nil;
}

-(void)updatePage
{
    NSString *newText = [[NSString alloc] initWithString:@"How about another page of additional text, this is to see if the view does update itself when needed :) fjbjfbds,jfbd,jhfb,sjdb,jhvbmdbdfsfjdf,jhdjdbsdjbhcj,hdbckdgksdjdfslgdskjfdfkgfskjbdcjsgfgflj liuh lruflhgaflzufaygfuygf uidlldjfhfdhlfu uhf ;h"];
    
    [self.theTextLabel addNewPageOfText:newText];
}

-(void)textViewDidFinishDisplayingText:(JLAnimatedTextView *)textView
{
    [self performSelector:@selector(updatePage) withObject:nil afterDelay:2.0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
