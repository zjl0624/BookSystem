//
//  UserInfoViewController.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
	UIImageView *iconImageView;
	UILabel *nameLabel;
}

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2 - 30, 60, 60, 60)];
	iconImageView.userInteractionEnabled = YES;
	iconImageView.backgroundColor = [UIColor redColor];
	[self.view addSubview:iconImageView];
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage)];
	[iconImageView addGestureRecognizer:tap];
	
	nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2 - 50, CGRectGetMaxY(iconImageView.frame) + 10, 100, 60)];
	nameLabel.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:nameLabel];
	[NetManager netRequestWithUrl:@"UessInfoAction.aspx" parameters:@{@"userId":@2} success:^(NSDictionary *dic) {
		if ([dic[@"Code"] integerValue] == 1000) {
			[iconImageView setImageWithURL:[NSURL URLWithString:dic[@"Data"][0][@"icon"]]];
			nameLabel.text = dic[@"Data"][0][@"username"];
		}
	} failure:^(NSString *errMsg) {
		
	}];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)tapImage {
	UIImagePickerController *ipc=[[UIImagePickerController alloc] init];
	ipc.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
	ipc.delegate=self;
	ipc.allowsEditing=NO;
	[self.navigationController presentViewController:ipc animated:YES completion:nil];

}

#pragma mark - UIImagePickerControllerDelegate
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *) info{
	UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
	if(picker.sourceType==UIImagePickerControllerSourceTypeCamera || picker.sourceType ==UIImagePickerControllerSourceTypePhotoLibrary){
		NSLog(@"%ld",image.imageOrientation);
		
		[NetManager upLoadImage:@"UpLoadImageAction.aspx" parameters:@{@"userId":@2} img:image success:^(NSDictionary *dic) {
			NSLog(@"%@",dic);
		} failure:^(NSString *errMsg) {
			NSLog(@"%@",errMsg);
		}];
//		[NetManager netRequestWithUrl:@"UpLoadImageAction.aspx" parameters:@{@"img":imgStr} success:^(NSDictionary *dic) {
//			NSLog(@"%@",dic);
//		} failure:^(NSString *errMsg) {
//			NSLog(@"%@",errMsg);
//		}];
	}
	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
	
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
