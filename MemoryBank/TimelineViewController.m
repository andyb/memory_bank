//
//  TimelineViewController.m
//  MemoryBank
//
//  Created by Andy Britcliffe on 23/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import "TimelineViewController.h"
#import "TimelineViewTableViewCell.h"
#import "AppDelegate.h"

@interface TimelineViewController ()

@end

@implementation TimelineViewController

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
    self.navigationItem.title = appDelegate.appTitle;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appDelegate.bgImageName]];
    
    self.months = [[NSMutableArray alloc] initWithObjects:@"March 2014",@"February 2014",@"January 2014",@"December 2013",@"November 2013",@"October 2013",@"September 2013",@"August 2013",@"July 2013",@"June 2013",@"May 2013",@"April 2013", nil];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.months count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"Cell";
    
    TimelineViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[TimelineViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    NSString *month = [self.months objectAtIndex:indexPath.row];
    
    cell.Title = month;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showMemoryListView" sender:self];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"showAddMemory"]) {
        AddMemoryViewController *controller = (AddMemoryViewController *) segue.destinationViewController;
        controller.delegate = self;
    }
}

- (void)addMemoryViewController:(AddMemoryViewController *)controller didAddRecentMemory:(MemoryEntry *)memory {
    [self saveMemoryToServer:memory];
    UIAlertView *saveAlert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"The memory has been saved!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [saveAlert show];
}

-(void)saveMemoryToServer:(MemoryEntry *) memory {
    
    PFObject *memoryToBeSaved = [PFObject objectWithClassName:@"Memory"];
    memoryToBeSaved[@"note"] = memory.note;
    memory.createdAt = [NSDate date];
    if(memory.pictures.count > 0) {
        NSData *imageData1 = UIImagePNGRepresentation(memory.pictures[0]);
        PFFile *imageFile1 = [PFFile fileWithName:@"image.png" data:imageData1];
        memoryToBeSaved[@"pic"] = imageFile1;

    }
    
    if(memory.pictures.count > 1) {
        NSData *imageData2 = UIImagePNGRepresentation(memory.pictures[1]);
        PFFile *imageFile2 = [PFFile fileWithName:@"image.png" data:imageData2];
        memoryToBeSaved[@"pic2"] = imageFile2;
    }
    
    [memoryToBeSaved saveInBackground];
}



@end
