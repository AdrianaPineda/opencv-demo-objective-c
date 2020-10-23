//
//  ViewController.h
//  OpenCVDemoObjC
//
//  Created by Adriana Pineda on 03/10/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/videoio/cap_ios.h>
using namespace cv;

@interface ViewController : UIViewController<CvVideoCameraDelegate>

@property (strong, nonatomic) IBOutlet UILabel *openCVVersionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cameraView;
- (IBAction)startButtonClicked:(id)sender;
- (IBAction)stopButtonClicked:(id)sender;

@end

