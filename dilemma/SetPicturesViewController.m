//
//  SetPicturesViewController.m
//  dilemma
//
//  Created by Macbook on 2014-06-07.
//  Copyright (c) 2014 Bricorp. All rights reserved.
//

#import "SetPicturesViewController.h"

@interface SetPicturesViewController ()

@end

@implementation SetPicturesViewController

@synthesize capturedImages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.capturedImages = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SendPhotos:(id)sender
{
    //open the photo picker controller
    
    // Check for camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
        // Create image picker controller
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        imagePicker.showsCameraControls = NO;
        
        
        // Show image picker
        [self presentViewController:imagePicker animated:YES completion:nil];
        
        self.imagePickerController = imagePicker;
    }
    else
    {
        
        //device has no camera
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No Camera", nil) message:NSLocalizedString(@"No Camera Detected!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
        
        return;
        
    }
}

#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
    
    if(self.capturedImages.count==1)
    {
       [self.imageView1 setImage:[self.capturedImages objectAtIndex:0]];
    }
    if(self.capturedImages.count==2)
    {
        [self.imageView1 setImage:[self.capturedImages objectAtIndex:1]];
    }
    if(self.capturedImages.count==3)
    {
        [self.imageView1 setImage:[self.capturedImages objectAtIndex:2]];
    }
    if(self.capturedImages.count==4)
    {
        [self.imageView1 setImage:[self.capturedImages objectAtIndex:3]];
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)TakePhoto:(id)sender
{
   
[self.imagePickerController takePicture];
  
}
- (IBAction)ConfirmPhotos:(id)sender
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
