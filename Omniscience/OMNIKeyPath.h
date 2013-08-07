//
//  OMNIKeyPath.h
//  Omniscience
//
//  Created by Richard Venable on 8/7/13.
//  Copyright (c) 2013 Allogy Interactive. All rights reserved.
//

/*
 Modified from https://github.com/jspahrsummers/libextobjc/blob/master/extobjc/EXTKeyPathCoding.h
 */

#import <Foundation/Foundation.h>

/**
 * \OMNIKeyPath allows compile-time verification of key paths. Given a real object
 * receiver and key path:
 *
 * @code

 NSString *versionPath = OMNIKeyPath(NSObject, version);
 // => @"version"

 NSString *lowercaseStringPath = OMNIKeyPath(NSString.new, lowercaseString);
 // => @"lowercaseString"

 * @endcode
 *
 * In addition to simply creating a key path, this macro ensures that the key
 * path is valid at compile-time (causing a syntax error if not), and supports
 * refactoring, such that changing the name of the property will also update any
 * uses of \@keypath.
 */

#define OMNIKeyPath(OBJ, PATH) \
(((void)(NO && ((void)OBJ.PATH, NO)), @# PATH))
