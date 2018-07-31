//
//  RegisterTableViewCell.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "RegisterTableViewCell.h"
@interface RegisterTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
@implementation RegisterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)confiureCell:(NSString *)title {
	self.selectionStyle = UITableViewCellSelectionStyleNone;
	_titleLabel.text = title;
	[_textField addTarget:self action:@selector(change:) forControlEvents:UIControlEventEditingChanged];
}

- (void)change:(UITextField *)textField {
	[self.delegate textFieldChange:textField title:_titleLabel.text];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

@end
