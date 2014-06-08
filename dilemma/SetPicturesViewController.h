//
//  SetPicturesViewController.h
//  dilemma
//
//  Created by Macbook on 2014-06-07.
//  Copyright (c) 2014 Bricorp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPicturesViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *SendPhotosButton;
- (IBAction)SendPhotos:(id)sender;

@property (nonatomic, weak) IBOutlet UIImageView *imageView1;
@property (nonatomic, weak) IBOutlet UIImageView *imageView2;
@property (nonatomic, weak) IBOutlet UIImageView *imageView3;
@property (nonatomic, weak) IBOutlet UIImageView *imageView4;

@property (nonatomic) IBOutlet UIView *overlayView;
@property (nonatomic) UIImagePickerController *imagePickerController;

@property (nonatomic,strong) NSMutableArray *capturedImages;

- (IBAction)TakePhoto:(id)sender;
- (IBAction)ConfirmPhotos:(id)sender;
@end
