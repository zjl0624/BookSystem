//
//  NetManager.m
//  BorrowBooksApp
//
//  Created by zjl on 2017/4/28.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager


+ (void)netRequestWithUrl:(NSString *)url
			   parameters:(NSDictionary *)param
				  success:(void (^)(NSDictionary * dic))success
				  failure:(void(^)(NSString * errMsg))failure{
	AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl]];
	manager.responseSerializer = [AFHTTPResponseSerializer serializer];
	[manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		NSString *resultStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
		NSData *data = [resultStr dataUsingEncoding:NSUTF8StringEncoding];
		NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
		success(jsonDic);
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		failure(error.description);
	}];
}

+ (void)upLoadImage:(NSString *)url
		 parameters:(NSDictionary *)param
				img:(UIImage *)img
			success:(void (^)(NSDictionary * dic))success
			failure:(void(^)(NSString * errMsg))failure {
	AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl]];
	manager.requestSerializer = [AFJSONRequestSerializer serializer];
	manager.responseSerializer = [AFHTTPResponseSerializer serializer];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", nil];
	[manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		formatter.dateFormat = @"yyyyMMddHHmmss";
		NSString *str = [formatter stringFromDate:[NSDate date]];
		NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
		NSData *imgData = UIImageJPEGRepresentation(img, 0.00001f);
		 [formData appendPartWithFileData:imgData name:@"img" fileName:fileName mimeType:@"image/jpg"];
	} progress:^(NSProgress * _Nonnull uploadProgress) {
		
	} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		NSString *resultStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
		NSData *data = [resultStr dataUsingEncoding:NSUTF8StringEncoding];
		NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
		success(jsonDic);

	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		failure(error.description);
	}];
}
@end
