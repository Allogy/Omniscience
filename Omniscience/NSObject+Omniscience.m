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

@end
