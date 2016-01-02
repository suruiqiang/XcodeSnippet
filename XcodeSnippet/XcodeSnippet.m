//
//  XcodeSnippet.m
//  XcodeSnippet
//
//  Created by Ray on 16/1/2.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "XcodeSnippet.h"

@interface XcodeSnippet()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation XcodeSnippet

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}


- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    [self copyCodeSnippetFilesToDestLocation];
}


- (void)copyCodeSnippetFilesToDestLocation{
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    libraryDirectory  = [libraryDirectory stringByAppendingPathComponent:@"Developer/Xcode/UserData/CodeSnippets/"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:libraryDirectory]){
        NSError *error = nil;
        if(![[NSFileManager defaultManager] createDirectoryAtPath:libraryDirectory withIntermediateDirectories:YES attributes:nil error:&error]){
            NSLog(@"%@",error);
            return;
        }
    }
    NSArray *directoryContents = [self.bundle pathsForResourcesOfType:@"codesnippet" inDirectory:nil];
    [directoryContents enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString* fileName = [(NSString *)obj lastPathComponent];
        NSString* destFilePath = [libraryDirectory stringByAppendingPathComponent:fileName];
        if (![[NSFileManager defaultManager] fileExistsAtPath:destFilePath]) {
            NSError* error;
            [[NSFileManager defaultManager] copyItemAtPath:obj toPath:destFilePath error:&error];
            if (error) {
                NSLog(@"error=%@",error);
            }
        }
    }];
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
