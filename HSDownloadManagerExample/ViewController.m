//
//  ViewController.m
//  HSDownloadManagerExample
//
//  Created by hans on 15/8/4.
//  Copyright © 2015年 hans. All rights reserved.
//

#import "ViewController.h"
#import "HSDownloadManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *progressLabel1;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel2;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel3;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView1;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView2;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES));
    
}
- (IBAction)download1:(UIButton *)sender {
    
    [[HSDownloadManager sharedInstance] download:@"http://120.25.226.186:32812/resources/videos/minion_01.mp4" progress:^(CGFloat progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressLabel1.text = [NSString stringWithFormat:@"%.f%%", progress * 100];
            self.progressView1.progress = progress;
        });
    } state:^(DownloadState state) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [sender setTitle:[self getTitleWithDownloadState:state] forState:UIControlStateNormal];
        });
    }];
}

- (IBAction)download2:(UIButton *)sender {
    [[HSDownloadManager sharedInstance] download:@"http://box.9ku.com/download.aspx?from=9ku" progress:^(CGFloat progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressLabel2.text = [NSString stringWithFormat:@"%.f%%", progress * 100];
            self.progressView2.progress = progress;
        });
    } state:^(DownloadState state) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [sender setTitle:[self getTitleWithDownloadState:state] forState:UIControlStateNormal];
        });
    }];
}

- (IBAction)download3:(UIButton *)sender {
    [[HSDownloadManager sharedInstance] download:@"http://pic6.nipic.com/20100330/4592428_113348097000_2.jpg" progress:^(CGFloat progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressLabel3.text = [NSString stringWithFormat:@"%.f%%", progress * 100];
            self.progressView3.progress = progress;
        });
    } state:^(DownloadState state) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [sender setTitle:[self getTitleWithDownloadState:state] forState:UIControlStateNormal];
        });
    }];
}

- (NSString *)getTitleWithDownloadState:(DownloadState)state
{
    switch (state) {
        case DownloadStateStart:
            return @"暂停";
        case DownloadStateSuspended:
        case DownloadStateFailed:
            return @"开始";
        case DownloadStateCompleted:
            return @"完成";
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
