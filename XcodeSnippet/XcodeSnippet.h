//
//  XcodeSnippet.h
//  XcodeSnippet
//
//  Created by Ray on 16/1/2.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import <AppKit/AppKit.h>

@class XcodeSnippet;

static XcodeSnippet *sharedPlugin;

@interface XcodeSnippet : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end