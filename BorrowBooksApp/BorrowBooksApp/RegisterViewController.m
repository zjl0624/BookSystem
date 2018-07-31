//
//  RegisterViewController.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterTableViewCell.h"
NSString  *cellIdentifier = @"RegisterCell";
@interface RegisterViewController ()<UITableViewDelegate,UITableViewDataSource,TextFieldChangeDelegate> {
	UITableView *tableview;
	NSArray *dataArray;
	NSMutableDictionary *paramDic;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
	tableview.delegate = self;
	tableview.dataSource = self;
	[self.view addSubview:tableview];
	tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableview.tableFooterView = [self createFooterView];
	[tableview registerNib:[UINib nibWithNibName:@"RegisterTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
	dataArray = @[@"账号：",@"密码：",@"用户名："];
	paramDic = [[NSMutableDictionary alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextFieldChangeDelegate
- (void)textFieldChange:(UITextField *)textField title:(NSString *)title {
	if ([title isEqualToString:dataArray[0]]) {
		[paramDic setObject:textField.text forKey:@"account"];
	}else if ([title isEqualToString:dataArray[1]]){
		[paramDic setObject:textField.text forKey:@"password"];
	}else {
		[paramDic setObject:textField.text forKey:@"username"];
	}
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	RegisterTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellIdentifier];
	cell.delegate = self;
	[cell confiureCell:dataArray[indexPath.row]];
	return cell;
	
}

- (UIView *)createFooterView {
	UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
	UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeSystem];
	finishButton.frame = CGRectMake(ScreenWidth - 10 - 100, 7.5, 100, 45);
	[finishButton setTitle:@"注册" forState:UIControlStateNormal];
	[finishButton addTarget:self  action:@selector(finishButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[footerView addSubview:finishButton];
	return footerView;
}
- (void)finishButtonClick {
	[NetManager netRequestWithUrl:@"RegisterAction.aspx" parameters:paramDic success:^(NSDictionary *dic) {
		if ([dic[@"Code"] integerValue] == 1000) {
			[self.navigationController popViewControllerAnimated:YES];
		}else {
			NSLog(@"%@",dic[@"Msg"]);
		}
	} failure:^(NSString *errMsg) {
		NSLog(@"%@",errMsg);
	}];
}
@end
