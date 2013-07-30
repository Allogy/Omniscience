//
//  OMNIProxyObservation.m
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import "OMNIProxyObservation.h"

@interface OMNIProxyObservation ()

@end

@implementation OMNIProxyObservation

- (id)init
{
	self = [super init];
	if (self) {
		self.isValidWithoutActualObservation = YES;
	}
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ isValid %d, isValidWithoutActualObservation %d, actual %@", [super description], self.isValid, self.isValidWithoutActualObservation, self.actualObservation];
}

- (BOOL)isValid
{
	if (self.actualObservation)
		return [self.actualObservation isValid];
	return self.isValidWithoutActualObservation;
}

- (void)remove
{
	self.isValidWithoutActualObservation = NO;
	[self.actualObservation remove];
}

@end
