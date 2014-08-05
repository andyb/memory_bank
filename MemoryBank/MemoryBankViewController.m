//
//  MemoryBankViewController.m
//  MemoryBank
//
//  Created by Andy Britcliffe on 06/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import "MemoryBankViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "MemoryPicture.h"
#import "MemoryBankViewCellTableViewCell.h"

@interface MemoryBankViewController ()
@end

@implementation MemoryBankViewController

-(void)setSelectedMemory:(MemoryEntry *)selectedMemory {
    _selectedMemory = selectedMemory;
    _pictures = [[NSMutableArray alloc] initWithArray:_selectedMemory.pictures];
}

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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.navigationItem.title = appDelegate.appTitle;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appDelegate.bgImageName]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@" MMM dd yyyy"];
    //self.view.backgroundColor = self.selectedMemory.bgColour;
    self.textView.text = self.selectedMemory.note;
    self.dateLabel.text =[formatter stringFromDate:self.selectedMemory.createdAt];
    [self loadImages];
    
   }

- (void) loadImages {
    if(self.selectedMemory.pictures.count > 0) {
        MemoryPicture* mp1 =self.selectedMemory.pictures[0];
        if(mp1.pic == nil) {
            [mp1.picFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                if (!error) {
                    mp1.pic = [UIImage imageWithData:imageData];
                    [self.tableView reloadData];
                }
            }];
        }
        
        //pic 2
        if(self.selectedMemory.pictures.count > 1) {
            MemoryPicture* mp2 =self.selectedMemory.pictures[1];
            if(mp2.pic == nil) {
                [mp2.picFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                    if (!error) {
                        mp2.pic = [UIImage imageWithData:imageData];
                        [self.tableView reloadData];
                    }
                }];
            }

     
        }
        
        //pic 3
        if(self.selectedMemory.pictures.count > 2) {
            MemoryPicture* mp3 =self.selectedMemory.pictures[2];
            if(mp3.pic == nil) {
                [mp3.picFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                    if (!error) {
                        mp3.pic = [UIImage imageWithData:imageData];
                        [self.tableView reloadData];
                    }
                }];
            }
            
            
        }
        
        //pic 4
        if(self.selectedMemory.pictures.count > 3) {
            MemoryPicture* mp4 =self.selectedMemory.pictures[3];
            if(mp4.pic == nil) {
                [mp4.picFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                    if (!error) {
                        mp4.pic = [UIImage imageWithData:imageData];
                        [self.tableView reloadData];
                    }
                }];
            }
            
            
        }



    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_pictures count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *tableIdentifier = @"Cell";
    
    MemoryBankViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[MemoryBankViewCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    MemoryPicture *pic = [_pictures objectAtIndex:indexPath.row];
    
    cell.pic.image = pic.pic;
    
    return cell;
}


@end
