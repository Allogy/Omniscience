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

- (void)observeTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath options:(NSKeyValueObservingOptions)options usingBlock:(void (^)(OMNINotification *))block
{
	[self stopObservingTargetKeyPath:targetKeyPath];
	[self observeTarget:targetKeyPath.target keyPath:targetKeyPath.keyPath options:options block:^(MAKVONotification *notification) {
		block(notification.omniscienceNotification);
	}];
}

- (void)observeTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath shouldCallBlockInitially:(BOOL)shouldCallBlockInitially shouldCallBlockPriorToUpdates:(BOOL)shouldCallBlockPriorToUpdates usingBlock:(void (^)(OMNINotification *))block
{
	NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
	if (shouldCallBlockInitially)
		options |= NSKeyValueObservingOptionInitial;
	if (shouldCallBlockPriorToUpdates)
		options |= NSKeyValueObservingOptionPrior;

	[self observeTargetKeyPath:targetKeyPath options:options usingBlock:block];
}

- (void)stopObservingTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath
{
	[self stopObserving:targetKeyPath.target keyPath:targetKeyPath.keyPath];
}

- (void)observeMovingTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath options:(NSKeyValueObservingOptions)options usingBlock:(void (^)(OMNINotification *))block
{
	[self stopObservingMovingTargetKeyPath:targetKeyPath];
	[self observeTarget:targetKeyPath.target keyPath:targetKeyPath.keyPath options:options block:^(MAKVONotification *notification) {
		block(notification.omniscienceNotification);
	}];
}

- (void)observeMovingTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath shouldCallBlockInitially:(BOOL)shouldCallBlockInitially shouldCallBlockPriorToUpdates:(BOOL)shouldCallBlockPriorToUpdates usingBlock:(void (^)(OMNINotification *))block
{
	NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
	if (shouldCallBlockInitially)
		options |= NSKeyValueObservingOptionInitial;
	if (shouldCallBlockPriorToUpdates)
		options |= NSKeyValueObservingOptionPrior;

	[self observeMovingTargetKeyPath:targetKeyPath options:options usingBlock:block];
}

- (void)stopObservingMovingTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath
{
	[self stopObserving:nil keyPath:targetKeyPath.keyPath];
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
