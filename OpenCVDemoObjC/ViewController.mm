//
//  ViewController.m
//  OpenCVDemoObjC
//
//  Created by Adriana Pineda on 03/10/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

#import "ViewController.h"
#import <opencv2/imgproc.hpp>

@interface ViewController ()

@property (nonatomic, retain) CvVideoCamera* videoCamera;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.videoCamera = [[CvVideoCamera alloc] initWithParentView: self.cameraView];
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    self.videoCamera.delegate = self;
}


- (IBAction)startButtonClicked:(id)sender {
     [self.videoCamera start];
}

- (IBAction)stopButtonClicked:(id)sender {
    [self.videoCamera stop];
}

#pragma mark - Protocol CvVideoCameraDelegate
#ifdef __cplusplus
- (void)processImage:(Mat&)image;
{
    // Do some OpenCV stuff with the image
    Mat image_copy;
    cvtColor(image, image_copy, COLOR_BGR2GRAY);
    // invert image
    bitwise_not(image_copy, image_copy);
    //Convert BGR to BGRA (three channel to four channel)
    Mat bgr;
    cvtColor(image_copy, bgr, COLOR_GRAY2BGR);
    cvtColor(bgr, image, COLOR_BGR2BGRA);
}
#endif

@end
