//
//  RegisterTableViewCell.h
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldChangeDelegate
- (void)textFieldChange:(UITextField *)textField title:(NSString *)title;
@end
@interface RegisterTableViewCell : UITableViewCell

@property (weak,nonatomic) id<TextFieldChangeDelegate> delegate;
- (void)confiureCell:(NSString *)title;
@end
