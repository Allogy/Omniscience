//
//  MAKVONotification+Omniscience.m
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import "MAKVONotification+Omniscience.h"

@interface MAKVONotification ()
{
    NSDictionary			*change;
}

@end

@implementation MAKVONotification (Omniscience)

- (OMNINotification *)omniscienceNotification
{
	OMNINotification *omniscienceNotification = [[OMNINotification alloc] initWithObserver:self.observer target:self.target keyPath:self.keyPath change:change];
	return omniscienceNotification;
}

@end
