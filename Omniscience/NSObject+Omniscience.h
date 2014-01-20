//
//  NSObject+Omniscience.h
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OMNIObservation.h"
#import "OMNINotification.h"
#import "OMNITargetKeyPath.h"

@interface NSObject (Omniscience)

/*
 There are currently two primary methods Omniscience adds for observing: the -addObserver... and the -observeTargetKeyPath... methods. Use -addObserver when you want to keep a reference to the observation object, and use -observeTargetKeyPath when you don't. With the observation object from -addObserver, you can call -remove on the observation object to remove the observation. To remove the observation from -observerTargetKeyPath, call -stopObservingTarget, or call -observerTargetKeyPath again with a new block.
 */

- (id<OMNIObservation>)addObserverForKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(void (^)(OMNINotification *notification))block;

/*
 Observe a target keyPath combination. Please use the OMNITargetKeyPath macro to create the first parameter.
 
 Stops observing the target keyPath combination if it had already been observing it with a different block.
 */
- (void)observeTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath options:(NSKeyValueObservingOptions)options usingBlock:(void (^)(OMNINotification *notification))block;
- (void)stopObservingTargetKeyPath:(_OMNITargetKeyPath *)targetKeyPath;

// DEPRECATED: use methods above instead
- (void)observeTarget:(id)target keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options usingBlock:(void (^)(OMNINotification *notification))block DEPRECATED_ATTRIBUTE;
- (void)stopObservingTarget:(id)target keyPath:(NSString *)keyPath DEPRECATED_ATTRIBUTE;

@end
