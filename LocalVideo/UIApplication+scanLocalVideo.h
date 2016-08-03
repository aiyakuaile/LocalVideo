//
//  UIApplication+scanLocalVideo.h
//  LocalVideo
//
//  Created by antvr on 16/8/2.
//  Copyright © 2016年 sunTengFei_family. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

typedef NS_ENUM(NSInteger , TFVideoAssetType){
    
    TFVideoAssetTypeVideoImageSource, //视频缩略图
    TFVideoAssetTypeVideoTimeLength,  //视频时长
    TFVideoAssetTypeVideoName,        //视频名称
};
@interface UIApplication (scanLocalVideo)
/**
 *  获取相册的授权
 *  @return YES/NO
 */
- (BOOL)authStatus;
/**
 *  视频的搜索结果
 *
 *  @return 返回的是一个数组集合，里面是PHAsset
 */
- (PHFetchResult *)assetsFetchResults;
/**
 *  获取所需要的Video属性
 *
 *  @param type TFVideoAssetType
 *
 *  @return 资源数组
 */
- (NSArray *)getVideoRelatedAttributesArray:(TFVideoAssetType)type;

@end
