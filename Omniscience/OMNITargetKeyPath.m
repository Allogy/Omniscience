//
//  OMNITargetKeyPath.m
//  Omniscience
//
//  Created by Richard Venable on 1/20/14.
//  Copyright (c) 2014 Allogy Interactive. All rights reserved.
//

#import "OMNITargetKeyPath.h"

@implementation _OMNITargetKeyPath

- (id)initWithTarget:(id)target keyPath:(NSString *)keyPath
{
	self = [super init];
	if (self) {
		_target = target;
		_keyPath = [keyPath copy];
	}
	return self;
}

@end
