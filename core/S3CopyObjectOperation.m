//
//  S3CopyObjectOperation.m
//  S3-Objc
//
//  Created by Michael Ledford on 12/11/09.
//  Copyright 2009 Michael Ledford. All rights reserved.
//

#import "S3CopyObjectOperation.h"

#import "S3ConnectionInfo.h"
#import "S3Bucket.h"
#import "S3Object.h"
#import "S3Extensions.h"

@interface S3CopyObjectOperation ()

@property(readwrite, retain) S3Object *sourceObject;
@property(readwrite, retain) S3Object *destinationObject;

@end

@implementation S3CopyObjectOperation

@synthesize sourceObject = _sourceObject;
@synthesize destinationObject = _destinationObject;

- (id)initWithConnectionInfo:(S3ConnectionInfo *)c sourceObject:(S3Object *)source destinationObject:(S3Object *)destination
{
    self = [super initWithConnectionInfo:c];
    
    if (self != nil) {
        [self setSourceObject:source];
        [self setDestinationObject:destination];
    }
    
	return self;
}

- (NSString *)kind
{
	return @"Object copy";
}

- (NSString *)requestHTTPVerb
{
    return @"PUT";
}

- (NSDictionary *)additionalHTTPRequestHeaders
{
    NSDictionary *destinationMetadata = [[self destinationObject] userDefinedMetadata];
    NSMutableDictionary *additionalMetadata = [NSMutableDictionary dictionary];
    
    if ([destinationMetadata count]) {
        [additionalMetadata setObject:@"REPLACE" forKey:@"x-amz-metadata-directive"];
        [additionalMetadata addEntriesFromDictionary:[[self destinationObject] metadata]];
    }
    
    NSString *copySource = [NSString stringWithFormat:@"/%@/%@", [[[self sourceObject] bucket] name], [[self sourceObject] key]];
    [additionalMetadata setObject:copySource forKey:@"x-amz-copy-source"];
    
    return additionalMetadata;
}

- (NSString *)bucketName
{
    return [[[self destinationObject] bucket] name];
}

- (NSString *)key
{
    return [[self destinationObject] key];
}

@end
