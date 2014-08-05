//
//  AddMemoryViewController.m
//  MemoryBank
//
//  Created by Andy Britcliffe on 03/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import "AddMemoryViewController.h"
#import "AppDelegate.h"

@interface AddMemoryViewController ()
@property BOOL notePlaceTextCleared;
@property NSInteger selectedPhotoBox;
@end

@implementation AddMemoryViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    
    return self;
}

- (void)viewDidLoad
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appDelegate.bgImageName]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Hides keyboard when click outside of ui elements
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

- (IBAction)saveButtonPressed:(id)sender {
    MemoryEntry* memory = [MemoryEntry initWithNote:self.noteTextView.text];
    MemoryPicture* p1 = [[MemoryPicture alloc] init];
    p1.pic =self.imageView1.image;
    MemoryPicture* p2 = [[MemoryPicture alloc] init];
    p2.pic =self.imageView2.image;
    MemoryPicture* p3 = [[MemoryPicture alloc] init];
    p3.pic =self.imageView3.image;
    MemoryPicture* p4 = [[MemoryPicture alloc] init];
    p4.pic =self.imageView4.image;
    [memory.pictures addObject:p1];
    [memory.pictures addObject:p2];
    [memory.pictures addObject:p3];
    [memory.pictures addObject:p4];
    [self.delegate addMemoryViewController:self didAddRecentMemory:(MemoryEntry *) memory];
    [self dismissViewControllerAnimated:YES completion:nil];

}

//clear entry text
- (void) textViewDidBeginEditing:(UITextView *)textView {
    if(!self.notePlaceTextCleared){
        self.notePlaceTextCleared = true;
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.saveButton.enabled = true;
}



- (IBAction)addImage1Button:(id)sender {
    _selectedPhotoBox = 1;
    [self showImagePicker];
}

- (IBAction)addImage2Button:(id)sender {
    _selectedPhotoBox = 2;
    [self showImagePicker];
}

- (IBAction)addImage3Button:(id)sender {
    _selectedPhotoBox = 3;
    [self showImagePicker];

}

- (IBAction)addImage4Button:(id)sender {
    _selectedPhotoBox = 4;
    [self showImagePicker];

}

- (void) showImagePicker {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    if (_selectedPhotoBox == 1) {
        self.imageView1.image = chosenImage;
        self.addPhoto1Button.titleLabel.text = @"";
    } else if(_selectedPhotoBox == 2) {
        self.imageView2.image = chosenImage;
        self.addPhoto2Button.titleLabel.text = @"";
    }
    else if(_selectedPhotoBox == 3) {
        self.imageView3.image = chosenImage;
        self.addPhoto3Button.titleLabel.text = @"";
    }
    else if(_selectedPhotoBox == 4) {
        self.imageView4.image = chosenImage;
        self.addPhoto4Button.titleLabel.text = @"";
    }
    
    //reset
    _selectedPhotoBox = 0;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
