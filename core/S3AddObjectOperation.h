//
//  S3AddObjectOperation.h
//  S3-Objc
//
//  Created by Michael Ledford on 11/26/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "S3Operation.h"

@class S3ConnectionInfo;
@class S3Object;

@interface S3AddObjectOperation : S3Operation {
    S3Object *_object;
}

- (id)initWithConnectionInfo:(S3ConnectionInfo *)c object:(S3Object *)o;

@property(readonly, retain) S3Object *object;

@end
