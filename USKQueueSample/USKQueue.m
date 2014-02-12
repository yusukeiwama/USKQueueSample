//
//  USKQueue.m
//  ShortestPath
//
//  Created by Yusuke IWAMA on 2/6/14.
//  Copyright (c) 2014 Yusuke Iwama. All rights reserved.
//

#import "USKQueue.h"

@interface USKQueue ()

@property NSMutableArray *mutableArray;

@end

@implementation USKQueue

- (NSString *)description
{
    NSMutableString *description = [[super description] mutableCopy];
    [description appendString:@"\n"];
    @synchronized (_mutableArray) {
        if ([self.mutableArray count] == 0) {
            [description appendFormat:@"Queue is Empty."];
        } else {
            for (int i = 0; i < [self.mutableArray count]; i++) {
                [description appendFormat:@"Object at index %d: %@\n", i, [self.mutableArray[i] description]];
            }
        }
    }
    return description;
}

#pragma mark - custom getters and setters
- (id)head
{
    return [self.mutableArray firstObject];
}

- (void)setHead:(id)anObject
{
    if (anObject == nil) {
        return;
    } else {
        @synchronized (_mutableArray) {
            [self.mutableArray insertObject:anObject atIndex:0];
        }
    }
}

- (id)tail
{
    return [self.mutableArray lastObject];
}

- (void)setTail:(id)anObject
{
    @synchronized (_mutableArray) {
        [self.mutableArray replaceObjectAtIndex:[self.mutableArray count] - 1 withObject:anObject];
    }
}

#pragma mark - constructors and initializers

+ (id)queueWithCapacity:(NSUInteger)numItems
{
    return [[USKQueue alloc] initWithCapacity:numItems];
}

- (id)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    if (self) {
        _mutableArray = [NSMutableArray arrayWithCapacity:numItems];
    }
    return self;
}

#pragma mark - queue operations

- (void)enqueue:(id)anObject
{
    if (anObject == nil) {
        return;
    }
    @synchronized (_mutableArray) {
        [self.mutableArray addObject:anObject];
    }
}

- (id)dequeue
{
    if ([self.mutableArray count] == 0) {
        return nil;
    }
    id head;
    @synchronized (_mutableArray) {
        head = [self.mutableArray firstObject];
        [self.mutableArray removeObjectAtIndex:0];
    }
    return head;
}

- (NSUInteger)count
{
    NSUInteger numItems = 0;
    @synchronized (_mutableArray) {
        numItems = [self.mutableArray count];
    }
    return numItems;
}


@end

#pragma mark - double edged queue operations

@implementation USKQueue (DoubleEndedQueue)

- (void)pushBack:(id)anObject
{
    [self enqueue:anObject];
}

- (void)pushFront:(id)anObject
{
    if (anObject == nil) {
        return;
    }
    @synchronized (_mutableArray) {
        [self.mutableArray insertObject:anObject atIndex:0];
    }
}

- (id)popBack
{
    if ([self.mutableArray count] == 0) {
        return nil;
    }
    id back;
    @synchronized (_mutableArray) {
        back = [self.mutableArray lastObject];
        [self.mutableArray removeObjectAtIndex:[self.mutableArray count] - 1];
    }
    return back;
}

- (id)popFront
{
    return [self dequeue];
}

- (id)front
{
    return self.head;
}

- (id)back
{
    return self.tail;
}

@end