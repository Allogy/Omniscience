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

- (id<OMNIObservation>)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(void (^)(OMNINotification *notification))block;

@end
