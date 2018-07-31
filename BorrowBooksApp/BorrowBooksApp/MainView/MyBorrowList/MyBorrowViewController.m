//
//  MyBorrowViewController.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "MyBorrowViewController.h"
#import "MyBorrowListTableViewCell.h"

@interface MyBorrowViewController ()<UITableViewDelegate,UITableViewDataSource>{
	UITableView *tableview;
	NSMutableArray *dataArray;
}

@end

@implementation MyBorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	dataArray= [[NSMutableArray alloc] init];
	tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
	[self.view addSubview:tableview];
	tableview.delegate = self;
	tableview.dataSource = self;
	[tableview registerNib:[UINib nibWithNibName:@"MyBorrowListTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyBorrowListCell"];
	[NetManager netRequestWithUrl:@"BorrowlistAction.aspx" parameters:@{@"userId":@2} success:^(NSDictionary *dic) {
		if ([dic[@"Code"] integerValue] == 1000) {
			for (NSDictionary *dict in dic[@"Data"]) {
				[dataArray addObject:dict];
			}
			[tableview reloadData];
		}else {
			NSLog(@"%@",dic[@"Msg"]);
		}

	} failure:^(NSString *errMsg) {
		NSLog(@"%@",errMsg);
	}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	MyBorrowListTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"MyBorrowListCell"];
	[cell configureWithDic:dataArray[indexPath.row]];
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%@",@"点击还书");
	[NetManager netRequestWithUrl:@"ReturnBookAction.aspx" parameters:@{@"bookId":dataArray[indexPath.row][@"bookId"],@"userId":@2} success:^(NSDictionary *dic) {
		if ([dic[@"Code"] integerValue] == 1000) {
			[dataArray removeObjectAtIndex:indexPath.row];
			[tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
			NSLog(@"%@",dic[@"Msg"]);
		}
	} failure:^(NSString *errMsg) {
		NSLog(@"%@",errMsg);
	}];
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 120;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return @"还书";
}
@end
