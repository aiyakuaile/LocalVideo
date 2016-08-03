# LocalVideo
基于photoKit的扫描本地视频分类
**扫描本地视频，我抽取出了三个分类和一个需要获取视频资源属性的枚举值**
```
需要填的枚举值
typedef NS_ENUM(NSInteger , TFVideoAssetType){
    
    TFVideoAssetTypeVideoImageSource, //视频缩略图
    TFVideoAssetTypeVideoTimeLength,  //视频时长
    TFVideoAssetTypeVideoName,        //视频名称
};
```
*最主要的三个方法*
```
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
```
*如何播放本地视频请参考demo*
