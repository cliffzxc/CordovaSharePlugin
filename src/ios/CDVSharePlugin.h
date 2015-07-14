//
//  HelloPlugin.h
//  HelloWorld
//
//  Created by mmc on 7/14/15.
//
//

#import <Cordova/CDVPlugin.h>
#import "UMSocial.h"

@interface CDVSharePlugin : CDVPlugin


-(void) share: (CDVInvokedUrlCommand*) command;

@end
