


//
//  TuiJuviewController.m
//  BaseProject
//
//  Created by mis on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuiJuviewController.h"

@interface TuiJuviewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView* webview;
@end

@implementation TuiJuviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webview reload];
}
-(UIWebView *)webview{
    if (!_webview) {
        _webview = [[UIWebView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_webview];
        [_webview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _webview.delegate = self;
        NSString* path = [NSString stringWithFormat:@"http://touch.lincoln.com.cn/?view=navigation-lcn"];
        NSURL* url = [NSURL URLWithString:path];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        [_webview loadRequest:request];
    }
    return _webview;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
