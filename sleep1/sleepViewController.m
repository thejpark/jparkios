//
//  sleepViewController.m
//  sleep1
//
//  Created by Park Jung Gyu on 17/02/14.
//  Copyright (c) 2014 pyfamily. All rights reserved.
//

#import "sleepViewController.h"

#import "HeavyViewController.h"

@implementation sleepViewController

@synthesize player;

- (IBAction)showCurrentT:(id)sender
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [tLabel setText:[formatter stringFromDate:now]];
    
    if (player.playing == YES)
		[self pausePlaybackForPlayer: player];
	else
		[self startPlaybackForPlayer: player];
    
    HeavyViewController *hhvc = [[HeavyViewController alloc] init];
    [[self navigationController] pushViewController:hhvc
                                           animated:YES];
}

-(IBAction)itemAction:(id)sender
{
    
}

- (void)viewDidLoad
{
    // probably this is the best place to define file url and create audio player, as this method is called
    // after Nib is loaded. initWithNibName:bundle can be called before nib is loaded.
	// Load the the sample file, use mono or stero sample
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: [[NSBundle mainBundle] pathForResource:@"kmkim" ofType:@"mp3"]];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
	if (self.player != nil) {
		player.numberOfLoops = 1;
		player.delegate = self;
	}
	
	[[AVAudioSession sharedInstance] setDelegate: self];
	
    NSError *setCategoryError = nil;
	
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
	if (setCategoryError) NSLog(@"Error setting category!");
    
	fileURL = nil;
}


-(void)pausePlaybackForPlayer:(AVAudioPlayer*)p
{
	[p pause];
    //	[self updateViewForPlayerState:p];
    NSLog(@"Pause play");
}

-(void)startPlaybackForPlayer:(AVAudioPlayer*)p
{
	if ([p play])
	{
        //		[self updateViewForPlayerState:p];
	}
	else
		NSLog(@"Could not play %@\n", p.url);
}

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *) bundle
{
    // call super class
    self = [super initWithNibName:nil
                           bundle:nil];
    if (self) {
        // get the tab bar item
//        UITabBarItem *tbi = [self tabBarItem];
//        
//        // give it a label
//        [tbi setTitle:@"play"];
    }
    
    if (self)
    {
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"Home"];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                target:self
                                action:@selector(itemAction:)];
        [n setRightBarButtonItem: bbi];
        [n setLeftBarButtonItem: [self editButtonItem]];
    
    }
    
    return self;
}

//// Do we need this? As this does not make any difference
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
//    return (toInterfaceOrientation == UIInterfaceOrientationPortrait) ||
//    UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
