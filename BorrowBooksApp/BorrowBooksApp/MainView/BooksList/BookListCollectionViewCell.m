//
//  BookListCollectionViewCell.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/5/5.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "BookListCollectionViewCell.h"
@interface BookListCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation BookListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)configureCell:(NSDictionary *)dic {
	[_coverImageView setImageWithURL:[NSURL URLWithString:dic[@"Cover"]]];
	_titleLabel.text = dic[@"bookName"];
}
@end
