//
//  OMNIProxyObservation.h
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OMNIObservation.h"

/**
 An OMNIObservation that serves as a proxy for another. This is useful when you want to maintain a reference to an observation that has yet to be created.
 
 For instance, when observing a Core Data managed object key path, the object may begin as a fault, in which case you don't want to observe a key path until you've faulted in the keypath. But you might still need to create the observation, so that you can cancel it on some event, even possibly before the fault completes. In this case, you can create a proxy observation. When the fault is complete, you can create the actual observation. If you need to cancel the observation before the fault is complete, just send the proxy the -remove message.
 */
@interface OMNIProxyObservation : NSObject <OMNIObservation>

/// A proxy observation is valid if its actual observation is valid, but it can also be valid if it doesn't have an actual observation. By default, the proxy is valid without an actual observation. A call to -remove will invalidate it.
@property (nonatomic, readwrite) BOOL isValidWithoutActualObservation;

@property (nonatomic, strong) id<OMNIObservation> actualObservation;

@end
