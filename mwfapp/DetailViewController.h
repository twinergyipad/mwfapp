//
//  DetailViewController.h
//  MWF_App
//
//  Created by Marco Madau on 2/28/12.
//  Copyright 2012 Twinergy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>



@class RootViewController;
@class WItem;


@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate>

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) NSManagedObject *detailItem;

@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;

@property (nonatomic, assign) WItem *witem;

- (IBAction)insertNewObject:(id)sender;

@end
