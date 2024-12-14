//
//  AppDelegate.m
//  TestTableView
//
//  Created by wellsnake on 13-6-23.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import "AppDelegate.h"
#import "SBJson.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //数据源和写入文件
    NSString *specialurl = @"http://1.getchhospital.sinaapp.com/getspecial";
    NSString *commUrl = @"http://1.getchhospital.sinaapp.com/getcommon";
    NSString *specialfile = @"specialClinic.plist";
    NSString *commfile = @"commClinic.plist";
    
    //读取数据源并写入相应得文件内
    [self readDateFromUrl:specialurl writeToFile:specialfile];
    [self readDateFromUrl:commUrl writeToFile:commfile];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)readDateFromUrl:(NSString *)url writeToFile:(NSString *)file
{
    //读取url获取json数据并将结果写入文件内，如果没有获取成功，那么就实用默认的文件
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    // 设置URL
    [request setURL:[NSURL URLWithString:url]];
    // 设置HTTP方法
    [request setHTTPMethod:@"GET"];
    //超时5秒表示连接失败
    request.timeoutInterval = 5;
    // 发送同步请求, 这里得returnData就是返回得数据了
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request
                                               returningResponse:nil error:nil];
    if (returnData)
    {
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *dict = [jsonParser objectWithData:returnData];
        //要往沙盒中写数据当然要先取的沙盒目录啦
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *plistPath = [paths objectAtIndex:0];
        //取得完整的文件名
        NSString *fileName = [plistPath stringByAppendingPathComponent:file];
        NSLog(@"fileName is %@", fileName);
        //创建并写入文件
        [dict writeToFile:fileName atomically:YES];
    }
}
@end
