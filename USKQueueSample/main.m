//
//  main.m
//  USKQueueSample
//
//  Created by Yusuke Iwama on 2/12/14.
//  Copyright (c) 2014 University of Tsukuba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USKQueue.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        USKQueue *queue = [USKQueue queueWithCapacity:3];
        NSLog(@"%@", [queue description]);
        [queue enqueue:@3];
        NSLog(@"%@", [queue description]);
        [queue enqueue:@{@"First": @"Yusuke",
                         @"Last" : @"Iwama"}];
        NSLog(@"%@", [queue description]);
        
        
    }
    return 0;
}

