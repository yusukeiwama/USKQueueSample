//
//  USKQueue.h
//  ShortestPath
//
//  Created by Yusuke IWAMA on 2/6/14.
//  Copyright (c) 2014 Yusuke Iwama. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum USKQueueError {
    USKQueueErrorOverflow = 1,
    USKQueueErrorUnderflow,
} USKQueueError;

/**
 The USKQueue class declares the programmatic interface to objects that manage a queue of objects. This class adds enqueue and dequeue operations.
 */
@interface USKQueue : NSObject

@property id head;
@property id tail;

/**
 Queue expand as needed; numItems simply establishes the object’s initial capacity.
 */
+ (id)queueWithCapacity:(NSUInteger)numItems;
- (id)initWithCapacity:(NSUInteger)numItems;

- (void)enqueue:(id)anObject;
- (id)dequeue;

/**
 Returns the number of objects currently in the queue.
 */
- (NSUInteger)count;

@end

@interface USKQueue (DoubleEndedQueue)

- (void)pushBack:(id)anObject;
- (void)pushFront:(id)anObject;
- (id)popBack;
- (id)popFront;

- (id)front;
- (id)back;

@end
