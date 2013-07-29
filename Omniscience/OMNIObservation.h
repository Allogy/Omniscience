//
//  OMNIObservation.h
//  Omniscience
//
//  Created by Richard Venable on 7/29/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OMNIObservation <NSObject>

@required
- (BOOL)isValid;	// returns NO if the observation has been deregistered by any means
- (void)remove;

@end
