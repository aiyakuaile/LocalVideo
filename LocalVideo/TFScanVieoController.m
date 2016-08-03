//
//  ViewController.m
//  LocalVideo
//
//  Created by antvr on 16/8/2.
//  Copyright © 2016年 sunTengFei_family. All rights reserved.
//

#import "TFScanVieoController.h"
#import "UIApplication+scanLocalVideo.h"
#import "TFVideoCell.h"
#import "playerViewController.h"
@interface TFScanVieoController ()

@end

@implementation TFScanVieoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    if (![[UIApplication sharedApplication]authStatus]) {
        
        NSLog(@"无权限访问相册---------------");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请求访问相册" message:@"前往设置->LocalVideo->允许访问照片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"prefs:root=com.antvr.LocalVideo"]];
            
        }];
        [alert addAction:cancel];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    

}
#pragma mark - 数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [UIApplication sharedApplication].assetsFetchResults.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TFVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"TFVideoCell" owner:nil options:nil].lastObject;
    }
    
    cell.videoNameLabel.text = [[UIApplication sharedApplication]getVideoRelatedAttributesArray:TFVideoAssetTypeVideoName][indexPath.row];
    cell.thumImageView.image = [[UIApplication sharedApplication]getVideoRelatedAttributesArray:TFVideoAssetTypeVideoImageSource][indexPath.row];
    cell.timeLengthLabel.text = [[UIApplication sharedApplication]getVideoRelatedAttributesArray:TFVideoAssetTypeVideoTimeLength][indexPath.row];
    
    return cell;
}
//点击播放的处理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PHAsset *asset = [[UIApplication sharedApplication]assetsFetchResults][indexPath.row];
    
    [[PHImageManager defaultManager] requestPlayerItemForVideo:asset options:nil resultHandler:^(AVPlayerItem * _Nullable playerItem, NSDictionary * _Nullable info) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            playerViewController *MD = [[playerViewController alloc]init];
            MD.playerItem = playerItem;
            [self.navigationController pushViewController:MD animated:YES];
        });
        
    }];
 

}
- (IBAction)refresh:(UIBarButtonItem *)sender {
    
    [self.tableView reloadData];
}
@end

