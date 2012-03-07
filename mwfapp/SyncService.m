//
//  SyncService.m
//  MWF_App
//
//  Created by Marco Madau on 3/5/12.
//  Copyright 2012 Twinergy. All rights reserved.
//

#import "SyncService.h"
#import "SBJson.h"

@implementation SyncService

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@synthesize response;

+ (NSString *)callSyncService:(NSString *)url:(NSString *)content { 
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSMutableURLRequest *request;
    NSData *postData; 
    NSError *error;
    NSURLResponse *response;
    NSHTTPURLResponse *httpResponse;
    NSData *dataReply;
    id stringReply;
      
    postData = [content dataUsingEncoding:NSASCIIStringEncoding];
    request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:url]];
    
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody:postData];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    // 	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  
    	
    dataReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    stringReply = (NSString *)[[NSString alloc] initWithData:dataReply encoding:NSASCIIStringEncoding]; //NSUTF8StringEncoding];
    // Some debug code, etc.
    NSLog(@"reply from server: %@", stringReply);
    httpResponse = (NSHTTPURLResponse *)response;
    int statusCode = [httpResponse statusCode];  
    NSLog(@"HTTP Response Headers %@", [httpResponse allHeaderFields]); 
    NSLog(@"HTTP Status code: %d", statusCode);
    // End debug.
    
    [pool release];
    return stringReply;
    
}

@end
