//
//  SyncService.h
//  MWF_App
//
//  Created by Marco Madau on 3/5/12.
//  Copyright 2012 Twinergy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyncService : NSObject

@property (nonatomic, retain) NSString *response;

+ (NSString *)callSyncService:(NSString *)url:(NSString *)content;

@end
