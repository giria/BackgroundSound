//
//  ViewController.m
//  BackgroundSound
//
//  Created by Joan Barrull Ribalta on 11/03/15.
//  Copyright (c) 2015 com.giria. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () 
@end

@implementation ViewController

@synthesize audioPlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Declare the audio file location and settup the player
   
    
    
    NSURL *audioFileLocationURL = [[NSBundle mainBundle] URLForResource:@"glass" withExtension:@"mp3"];
    
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: audioFileLocationURL error:&error];
    [audioPlayer setNumberOfLoops:-1];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
        
        [[self volumeControl] setEnabled:NO];
        [[self playPauseButton] setEnabled:NO];
        
        [[self alertLabel] setText:@"Unable to load file"];
        [[self alertLabel] setHidden:NO];
    } else {
        [[self alertLabel] setText:[NSString stringWithFormat:@"%@ has loaded", @"HeadspinLong.caf"]];
        [[self alertLabel] setHidden:NO];
        
        //Make sure the system follows our playback status
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        [[AVAudioSession sharedInstance] setActive: YES error: nil];
        
        //Load the audio into memory
        [audioPlayer prepareToPlay];
    }
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)volumeDidChange:(UISlider *)slider {
    //Handle the slider movement
    [audioPlayer setVolume:[slider value]];
}

- (IBAction)togglePlayingState:(id)button {
    //Handle the button pressing
    [self togglePlayPause];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    //Once the view has loaded then we can register to begin recieving controls and we can become the first responder
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (IBAction)playAudio:(UIButton *)sender {
    
    //Play the audio and set the button to represent the audio is playing
    [audioPlayer play];
    [playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];

}




@end
