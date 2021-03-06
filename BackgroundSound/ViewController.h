//
//  ViewController.h
//  BackgroundSound
//
//  Created by Joan Barrull Ribalta on 11/03/15.
//  Copyright (c) 2015 com.giria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController {

IBOutlet UIButton *playPauseButton; //Toggles the playback state
IBOutlet UISlider *volumeControl; //Sets the volume for the audio player
IBOutlet UILabel *alertLabel; //The alert label showing the status of the loading of the file

AVAudioPlayer *audioPlayer; //Plays the audio
    
}

@property (nonatomic, retain) IBOutlet UIButton *playPauseButton;
@property (nonatomic, retain) IBOutlet UISlider *volumeControl;
@property (nonatomic, retain) IBOutlet UILabel *alertLabel;

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

- (IBAction)volumeDidChange:(id)slider; //handle the slider movement
- (IBAction)togglePlayingState:(id)button; //handle the button tapping
- (IBAction)playAudio:(UIButton *)sender;


- (void)pauseAudio; //pause the audio
- (void)togglePlayPause; //toggle the state of the audio


@end

