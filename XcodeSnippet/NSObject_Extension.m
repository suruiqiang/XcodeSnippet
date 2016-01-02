//
//  NSObject_Extension.m
//  XcodeSnippet
//
//  Created by Ray on 16/1/2.
//  Copyright © 2016年 Ray. All rights reserved.
//


#import "NSObject_Extension.h"
#import "XcodeSnippet.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[XcodeSnippet alloc] initWithBundle:plugin];
        });
    }
}
@end
