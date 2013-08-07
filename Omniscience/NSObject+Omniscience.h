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

@interface NSObject (Omniscience)

/*
 There are currently two primary methods Omniscience adds for observing: the -addObserver... and the -observeTarget... methods. Use -addObserver when you want to keep a reference to the observation object, and use -observeTarget when you don't. With the observation object from -addObserver, you can call -remove on the observation object to remove the observation. To remove the observation from -observerTarget, call -stopObservingTarget.
 */

- (id<OMNIObservation>)addObserverForKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(void (^)(OMNINotification *notification))block;

- (void)observeTarget:(id)target keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options usingBlock:(void (^)(OMNINotification *notification))block;
- (void)stopObservingTarget:(id)target keyPath:(NSString *)keyPath;

@end
