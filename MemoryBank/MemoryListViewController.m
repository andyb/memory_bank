//
//  ViewController.m
//  MemoryBank
//
//  Created by Andy Britcliffe on 03/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import "MemoryListViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"



@interface MemoryListViewController ()
@property (nonatomic,strong) MemoryEntry* selectedMemory;
@end

@implementation MemoryListViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        _recentMemories = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)loadMemories {
    PFQuery *query = [PFQuery queryWithClassName:@"Memory"];
    [query orderByDescending:@"createdAt"];\
    
    //create dates
    //NSString *stringDate = @"March 22, 2014";
    // Convert string to date object
    //NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //[dateFormat setDateFormat:@"MM dd, yyyy"];
    
    //NSDate* lessThan  = [dateFormat dateFromString:stringDate];
    //[query whereKey:@"createdAt" lessThan:lessThan];
    
    NSArray* memories = [query findObjects];
    for (int i = 0; i < [memories count]; i++) {
        PFObject* loadedMemory = memories[i];
        MemoryEntry* m = [MemoryEntry initWithNote:loadedMemory[@"note"]];
        
        MemoryPicture* p1 = [[MemoryPicture alloc]init];
        p1.picFile =loadedMemory[@"pic"];
        [m.pictures addObject:p1];
        
        MemoryPicture* p2 = [[MemoryPicture alloc]init];
        p2.picFile = loadedMemory[@"pic2"];
        [m.pictures addObject:p2];
        
        MemoryPicture* p3 = [[MemoryPicture alloc]init];
        p3.picFile = loadedMemory[@"pic3"];
        [m.pictures addObject:p3];
        
        MemoryPicture* p4 = [[MemoryPicture alloc]init];
        p4.picFile = loadedMemory[@"pic4"];
        [m.pictures addObject:p4];
        m.createdAt = loadedMemory.createdAt;
        [self.recentMemories addObject:m];
    }
}

- (void)viewDidLoad
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.navigationItem.title = appDelegate.appTitle;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appDelegate.bgImageName]];
    
    [self loadMemories];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.recentMemories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"Cell";
    
    MemoryBankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[MemoryBankTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    MemoryEntry *memory = [self.recentMemories objectAtIndex:indexPath.row];
    
    cell.Title = memory.note;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MemoryEntry *memory = [self.recentMemories objectAtIndex:indexPath.row];
    self.selectedMemory = memory;
    
    [self performSegueWithIdentifier:@"showMemoryBank" sender:self];
}

- (void)addMemoryViewController:(AddMemoryViewController *)controller didAddRecentMemory:(MemoryEntry *)memory {
    [self saveMemoryToServer:memory];
    [self.recentMemories insertObject:memory atIndex:0];
    [self.tableView reloadData];
    UIAlertView *saveAlert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"The memory has been saved!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [saveAlert show];
}

-(void)saveMemoryToServer:(MemoryEntry *) memory {
    PFObject *memoryToBeSaved = [PFObject objectWithClassName:@"Memory"];
    memoryToBeSaved[@"note"] = memory.note;
    memory.createdAt = [NSDate date];
    if(memory.pictures.count > 0) {
        MemoryPicture* mp1 =memory.pictures[0];
        NSData *imageData1 = UIImagePNGRepresentation(mp1.pic);
        PFFile *imageFile1 = [PFFile fileWithName:@"image.png" data:imageData1];
        memoryToBeSaved[@"pic"] = imageFile1;
        
    }
    
    if(memory.pictures.count > 1) {
        MemoryPicture* mp2 = memory.pictures[1];
        NSData *imageData2 = UIImagePNGRepresentation(mp2.pic);
        PFFile *imageFile2 = [PFFile fileWithName:@"image2.png" data:imageData2];
        memoryToBeSaved[@"pic2"] = imageFile2;
    }

    if(memory.pictures.count > 2) {
        MemoryPicture* mp3 = memory.pictures[2];
        NSData *imageData3 = UIImagePNGRepresentation(mp3.pic);
        PFFile *imageFile3 = [PFFile fileWithName:@"image3.png" data:imageData3];
        memoryToBeSaved[@"pic3"] = imageFile3;
    }
    
    if(memory.pictures.count > 3) {
        MemoryPicture* mp4 = memory.pictures[3];
        NSData *imageData4 = UIImagePNGRepresentation(mp4.pic);
        PFFile *imageFile4 = [PFFile fileWithName:@"image4.png" data:imageData4];
        memoryToBeSaved[@"pic4"] = imageFile4;
    }

    [memoryToBeSaved saveInBackground];	
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual:@"showMemoryBank"]) {
        MemoryBankViewController *controller = (MemoryBankViewController *) segue.destinationViewController;
        controller.selectedMemory = self.selectedMemory;
    }
    
    if([segue.identifier isEqualToString:@"showAddMemory"]) {
        AddMemoryViewController *controller = (AddMemoryViewController *) segue.destinationViewController;
        controller.delegate = self;
    }


}


@end
