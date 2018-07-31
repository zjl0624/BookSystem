//
//  BooksListViewController.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "BooksListViewController.h"
#import "BookListCollectionViewCell.h"
@interface BooksListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource> {
	UICollectionView *collectionview;
	NSMutableArray *dataArray;
}

@end

@implementation BooksListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	dataArray = [[NSMutableArray alloc] init];
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	layout.itemSize = CGSizeMake((ScreenWidth - 32)/3, (ScreenWidth - 32) * 1.5/3);
	layout.minimumInteritemSpacing = 8;
	layout.minimumLineSpacing = 8;
	collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(8, 64, ScreenWidth - 16, ScreenHeight - 64) collectionViewLayout:layout];
	collectionview.dataSource = self;
	collectionview.delegate = self;
	collectionview.backgroundColor = [UIColor whiteColor];
	collectionview.alwaysBounceVertical = YES;
	[self.view addSubview:collectionview];
	[collectionview registerNib:[UINib nibWithNibName:@"BookListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BookListCell"];
	
	[NetManager netRequestWithUrl:@"BookListAction.aspx" parameters:@{} success:^(NSDictionary *dic) {
		if ([dic[@"Code"] integerValue] == 1000) {
			for (NSDictionary *dict in dic[@"Data"]) {
				[dataArray addObject:dict];
			}
			[collectionview reloadData];
		}
	} failure:^(NSString *errMsg) {
		NSLog(@"%@",errMsg);
	}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [dataArray count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	BookListCollectionViewCell *cell = [collectionview dequeueReusableCellWithReuseIdentifier:@"BookListCell" forIndexPath:indexPath];
	[cell configureCell:dataArray[indexPath.row]];
	return cell;
}


@end
