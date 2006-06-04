//
//  S3LoginController.h
//  S3-Objc
//
//  Created by Olivier Gutknecht on 4/7/06.
//  Copyright 2006 Olivier Gutknecht. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "S3BucketOperations.h"

@class S3Connection;

@interface S3LoginController : NSWindowController  <S3OperationDelegate> {
	S3Connection* _connection;
	S3Operation* _operation;
	IBOutlet NSButton* _defaultButton;
	IBOutlet NSButton* _keychainCheckbox;
}

- (IBAction)connect:(id)sender;
- (IBAction)openHelpPage:(id)sender;
- (IBAction)flippedKeychainSupport:(id)sender;

- (void)setConnection:(S3Connection *)aConnection;
- (void)setOperation:(S3Operation *)operation;
- (void)checkPasswordInKeychain;

- (NSString*)getS3KeyFromKeychainForUser:(NSString *)username;
- (BOOL)setS3KeyToKeychainForUser:(NSString *)username password:(NSString*)password;

@end