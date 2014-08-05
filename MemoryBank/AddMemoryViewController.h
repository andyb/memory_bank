//
//  AddMemoryViewController.h
//  MemoryBank
//
//  Created by Andy Britcliffe on 03/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemoryEntry.h"
#import "MemoryPicture.h"


@class AddMemoryViewController;

@protocol AddMemoryViewControllerDelegate <NSObject>
- (void)addMemoryViewController:(AddMemoryViewController *)controller didAddRecentMemory:(MemoryEntry *)memory;
@end

@interface AddMemoryViewController : UIViewController<UITextViewDelegate,UIImagePickerControllerDelegate>
- (IBAction)saveButtonPressed:(id)sender;

@property (nonatomic, weak) id <AddMemoryViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextView *noteTextView;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)addImage1Button:(id)sender;
- (IBAction)addImage2Button:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIButton *addPhoto1Button;
@property (strong, nonatomic) IBOutlet UIButton *addPhoto2Button;
@property (strong, nonatomic) IBOutlet UIButton *addPhoto3Button;
@property (strong, nonatomic) IBOutlet UIButton *addPhoto4Button;

@end
