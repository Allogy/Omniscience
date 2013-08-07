//
//  OMNINotification.m
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import "OMNINotification.h"

@implementation OMNINotification

- (id)initWithObserver:(id)observer target:(id)target keyPath:(NSString *)keyPath change:(NSDictionary *)change
{
	self = [super init];
	if (self) {
		_observer = observer;
		_target = target;
		_keyPath = [keyPath copy];
		_change = change;
	}
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ observer: %@ target: %@ keyPath: %@ change: %@", [super description], self.observer, self.target, self.keyPath, self.change];
}

- (NSKeyValueChange)kind
{
	return [[self.change objectForKey:NSKeyValueChangeKindKey] unsignedIntegerValue];
}

- (id)newValue
{
	NSKeyValueChange kind = self.kind;
	if (kind != NSKeyValueChangeSetting && kind != NSKeyValueChangeReplacement && kind != NSKeyValueChangeInsertion)
		return nil;

	id value = [self.change objectForKey:NSKeyValueChangeNewKey];
	NSAssert(value, @"No new value found - you must specify NSKeyValueObservingOptionNew.");

	// Don't return NSNulls
	if ([value isKindOfClass:[NSNull class]])
		return nil;

	return value;
}

- (id)oldValue
{
	NSKeyValueChange kind = self.kind;
	if (kind != NSKeyValueChangeSetting && kind != NSKeyValueChangeReplacement && kind != NSKeyValueChangeRemoval)
		return nil;

	id value = [self.change objectForKey:NSKeyValueChangeOldKey];
	NSAssert(value, @"No new value found - you must specify NSKeyValueObservingOptionOld.");

	// Don't return NSNulls
	if ([value isKindOfClass:[NSNull class]])
		return nil;

	return value;
}

- (NSIndexSet *)indexes
{
	return [self.change objectForKey:NSKeyValueChangeIndexesKey];
}

- (BOOL)isPrior
{
	return [[self.change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
}

@end
