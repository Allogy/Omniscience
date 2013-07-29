//
//  OMNINotification.h
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMNINotification : NSObject

@property (nonatomic, weak, readonly) id observer;
@property (nonatomic, weak, readonly) id target;
@property (nonatomic, strong, readonly) NSString *keyPath;

@property (nonatomic, strong, readonly) NSDictionary *change;

@property (nonatomic, readonly) NSKeyValueChange kind;
@property (nonatomic, readonly) id newValue;
@property (nonatomic, readonly) id oldValue;
@property (nonatomic, readonly) NSIndexSet *indexes;
@property (nonatomic, readonly) BOOL isPrior;

- (id)initWithObserver:(id)observer target:(id)target keyPath:(NSString *)keyPath change:(NSDictionary *)change;

@end
