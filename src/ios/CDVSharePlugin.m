//
//  HelloPlugin.m
//  HelloWorld
//
//  Created by mmc on 7/14/15.
//
//

#import "CDVSharePlugin.h"
#import "UMSocialWechatHandler.h"

@implementation CDVSharePlugin

// arg0: text arg1: img src arg2: url
-(void) share:(CDVInvokedUrlCommand *)command
{
    
    
    NSString* text = [[NSString alloc] initWithString:[command argumentAtIndex:0 withDefault:@" "]];
    NSString* imgSrc = [[NSString alloc] initWithString:[command argumentAtIndex:1 withDefault:@"logo.png"]];
    if ([imgSrc hasPrefix:@"file://"]) {
            imgSrc = [imgSrc substringFromIndex:7];
    }
    NSString* url = [[NSString alloc] initWithString:[command argumentAtIndex:2 withDefault:@"null"]];


//    [[[UIAlertView alloc]initWithTitle:@" " message:imgSrc delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:url];
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;

    [UMSocialSnsService presentSnsIconSheetView:[super viewController] appKey:nil shareText:text shareImage:[UIImage imageNamed:imgSrc] shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,nil] delegate:nil];
    
    [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult = nil;
        NSString* myarg = [command argumentAtIndex:0];
        
        
        
        if (myarg != nil) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
        }
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}


@end
