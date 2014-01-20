//
//  OMNITargetKeyPath.h
//  Omniscience
//
//  Created by Richard Venable on 1/20/14.
//  Copyright (c) 2014 Allogy Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

// Macro for making an object that includes both a target and key path.
// Used to populate the first parameter of -observeTargetKeyPath:options:usingBlock:
#define OMNITargetKeyPath(OBJ, PATH) \
([[_OMNITargetKeyPath alloc] initWithTarget:OBJ keyPath:(((void)(NO && ((void)OBJ.PATH, NO)), @# PATH))])

@interface _OMNITargetKeyPath : NSObject

@property (nonatomic, strong, readonly) id target;
@property (nonatomic, copy, readonly) NSString *keyPath;

- (id)initWithTarget:(id)target keyPath:(NSString *)keyPath;

@end
