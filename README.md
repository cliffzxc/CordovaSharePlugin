# CordovaSharePlugin

这是自己制作的分享插件，利用了友盟的分享插件作为Native端调用（目前继承了微信好友，微信朋友圈，微信收藏和微博分享）。

安装好插件后，需移步http://dev.umeng.com/social/ios/detail-share 下载友盟最新社会化分享插件，并按照以下几步添加：

###1、将UMSocial_Sdk_4.X.X文件夹添加入工程。
###2、将UMSocial_Sdk_Extra_Frameworks文件夹添加入工程，里面需要至少加入SinaSSO、Wechar文件夹。
###3、在AppDelegate中设置友盟的AppKey：
\#import "UMSocial.h"

\#import "UMSocialWechatHandler.h"

\#import "UMSocialSinaSSOHandler.h"
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UMSocialData setAppKey:@“XXXXXXXXXXX”];
    [UMSocialWechatHandler setWXAppId:@"wxdXXXXXXXXXX” appSecret:@“XXXXXXXXXXXXXX” url:@"http://www.umeng.com/social"];
    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}
```
###4、添加url scheme：
微博：“wb”+新浪appkey，例如“wb126663232”
微信：应用appId，例如“wxd9a39c7122aa6516”
###5、在AppDelegate实现以下回调方法：
```objective-c
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
 return  [UMSocialSnsService handleOpenURL:url];    
}
- (BOOL)application:(UIApplication *)application 
              openURL:(NSURL *)url 
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK
    }
    return result;
}  
```
###6、JS中，在需要分享的按钮分配以下事件即可调用分享：
```objective-c
share([text,imgSrc,url],function(data){},function(data){alert("fail:"+data);});
```
其中text是分享的文本信息，imgSrc是分享的图片在本地的地址，url是分享的链接信息
