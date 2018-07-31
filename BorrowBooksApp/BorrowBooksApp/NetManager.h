//
//  NetManager.h
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NetManager : NSObject
+ (void)netRequestWithUrl:(NSString *)url
			   parameters:(NSDictionary *)param
				  success:(void (^)(NSDictionary * dic))success
				  failure:(void(^)(NSString * errMsg))failure;


+ (void)upLoadImage:(NSString *)url
		 parameters:(NSDictionary *)param
				img:(UIImage *)img
			success:(void (^)(NSDictionary * dic))success
			failure:(void(^)(NSString * errMsg))failure;
@end
