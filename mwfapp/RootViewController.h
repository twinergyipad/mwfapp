//
//  RootViewController.h
//  MWF_App
//
//  Created by Marco Madau on 2/28/12.
//  Copyright 2012 Twinergy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class DataController;

#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) DataController *dataController;

- (void)insertNewObject:(id)sender;

@end
