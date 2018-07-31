//
//  ViewController.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "MainTabBarController.h"

@interface ViewController () {
	NSMutableDictionary *paramDic;
}
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	paramDic = [[NSMutableDictionary alloc] init];
	[_accountTextField addTarget:self action:@selector(accountChange:) forControlEvents:UIControlEventEditingChanged];
	[_passwordTextField addTarget:self action:@selector(passwordChange:) forControlEvents:UIControlEventEditingChanged];
	[_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[_registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[_iconImageView setImageWithURL:[NSURL URLWithString:@"http://127.0.0.1:8080/BooksSystem/Utils/icon1.jpg"]];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}
#pragma mark - private method
- (void)accountChange:(UITextField *)textField {
	[paramDic setObject:textField.text forKey:@"account"];
}

- (void)passwordChange:(UITextField *)textField {
	[paramDic setObject:textField.text forKey:@"password"];
}

- (void)loginButtonClick {
	[NetManager netRequestWithUrl:@"LoginAction.aspx" parameters:paramDic success:^(NSDictionary *dic) {
		NSLog(@"%@",dic[@"Msg"]);
		UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
		MainTabBarController *vc = [story instantiateViewControllerWithIdentifier:@"MainTableBarVC"];
		[self.navigationController pushViewController:vc animated:YES];
	} failure:^(NSString *errMsg) {
		NSLog(@"%@",errMsg);
	}];
}

- (void)registerButtonClick {
	UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	RegisterViewController *vc = [story instantiateViewControllerWithIdentifier:@"RegisterVC"];
	[self.navigationController pushViewController:vc animated:YES];
}
@end
