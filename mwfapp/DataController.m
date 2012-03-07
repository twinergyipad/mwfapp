//
//  DataController.m
//  MWF_App
//
//  Created by Marco Madau on 3/2/12.
//  Copyright 2012 Twinergy. All rights reserved.
//
// GITHUB

#import "DataController.h"
#import "WItem.h"
#import "SyncService.h"


@interface DataController ()

@property (nonatomic, copy, readwrite) NSMutableArray *list;

- (void)createDemoData;

@end



@implementation DataController

@synthesize list;


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        [self createDemoData];    }
    
    return self;
}


// Custom set accessor to ensure the new list is mutable.
- (void)setList:(NSMutableArray *)newList {
    if (list != newList) {
        list = [newList mutableCopy];
    }
}


// Accessor methods for list.
- (unsigned)countOfList {
    return [list count];
}

- (WItem *)objectInListAtIndex:(unsigned)theIndex {    
    return [list objectAtIndex:theIndex];
    
}


- (void)createDemoData {
    
    NSMutableArray *witemList = [[NSMutableArray alloc] init];
    WItem *witem;
    
    NSString *urlResponse;
    
    NSString *postBody;
    NSString *urlStr;
    urlStr = @"http://213.209.214.48/MSWFrontendServices/MSWFFrontend?servicename=SyncTasks";
    postBody = @"{\"password\":\"sultans\",\"updates\":{\"tasksList\":[]},\"username\":\"ROSPAS\"}";
    urlResponse = [SyncService callSyncService:(NSString *)urlStr:(NSString *)postBody];
    
    witem = [[WItem alloc] init];	    
    witem.wiid = @"0000010001";
    witem.witype = @"A";
    witem.witext = @"WorkItem 1";
    witem.prio = @"5";
    [witemList addObject:witem];
    
    witem = [[WItem alloc] init];    
    witem.wiid = @"0000010002";
    witem.witype = @"T";
    witem.witext = @"WorkItem 2";
    witem.prio = @"5";
    [witemList addObject:witem];    
    
    witem = [[WItem alloc] init];    
    witem.wiid = @"0000010003";
    witem.witype = @"T";
    witem.witext = @"WorkItem 3";
    witem.prio = @"1";
    [witemList addObject:witem];    
    
    self.list = witemList;    
    
}


@end	
