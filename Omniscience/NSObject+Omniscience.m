//
//  NSObject+Omniscience.m
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import "NSObject+Omniscience.h"
#import "MAKVONotification+Omniscience.h"

@implementation NSObject (Omniscience)

- (id<OMNIObservation>)addObserverForKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(void (^)(OMNINotification *))block
{
	return (id<OMNIObservation>)[self addObservationKeyPath:keyPath options:options block:^(MAKVONotification *notification) {
		block(notification.omniscienceNotification);
	}];
}

- (void)observeTarget:(id)target keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options usingBlock:(void (^)(OMNINotification *))block
{
	[self observeTarget:target keyPath:keyPath options:options block:^(MAKVONotification *notification) {
		block(notification.omniscienceNotification);
	}];
}

- (void)stopObservingTarget:(id)target keyPath:(NSString *)keyPath
{
	[self stopObserving:target keyPath:keyPath];
}

@end
