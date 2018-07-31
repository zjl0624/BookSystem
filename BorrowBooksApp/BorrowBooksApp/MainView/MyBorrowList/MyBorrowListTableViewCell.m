//
//  MyBorrowListTableViewCell.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/5/25.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "MyBorrowListTableViewCell.h"
@interface MyBorrowListTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;


@end
@implementation MyBorrowListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configureWithDic:(NSDictionary *)dic {
	[_coverImageView setImageWithURL:[NSURL URLWithString:dic[@"cover"]]];
	_titleLabel.text = dic[@"bookName"];
	_authorLabel.text = dic[@"author"];
	_summaryLabel.text = dic[@"summary"];
}

@end
