//
//  ViewController.m
//  HHH
//
//  Created by zjl on 2017/4/17.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()<UIWebViewDelegate>
@property (strong, nonatomic)  UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	_webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	[self.view addSubview:_webview];
	_webview.delegate = self;
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//	manager.requestSerializer =  [AFHTTPRequestSerializer serializer];
	manager.responseSerializer = [AFHTTPResponseSerializer serializer];
	[manager POST:@"http://192.168.10.25:8080/Test.aspx" parameters:@{@"name":@"哈哈"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		NSLog(@"%@",responseObject);
		[_webview loadHTMLString:[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] baseURL:nil];
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		NSLog(@"%@",error.description);
	}];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
	NSLog(@"加载成功");
	
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	NSLog(@"%@",error.description);
}
@end
