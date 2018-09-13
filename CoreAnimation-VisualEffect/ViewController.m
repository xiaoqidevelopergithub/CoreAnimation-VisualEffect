//
//  ViewController.m
//  CoreAnimation-VisualEffect
//
//  Created by 张晓琪 on 2018/9/13.
//  Copyright © 2018年 张晓琪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *layerView2;
@property (weak, nonatomic) IBOutlet UIView *layerView3;
@property (weak, nonatomic) IBOutlet UIView *layerView4;
@property (weak, nonatomic) IBOutlet UIView *layerView5;
@property (weak, nonatomic) IBOutlet UIView *layerView6;
@property (weak, nonatomic) IBOutlet UIView *layerView7;
@property (weak, nonatomic) IBOutlet UIView *layerView8;
@property (weak, nonatomic) IBOutlet UIView *layerView8ShadowView;
@property (weak, nonatomic) IBOutlet UIView *layerView9;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *dogImage = [UIImage imageNamed:@"未登录"];
    
    self.layerView.layer.cornerRadius = 20.0;
    self.layerView2.layer.cornerRadius = 20.0;
    
    self.layerView2.layer.masksToBounds = YES;
    
    /* cornerRadius 只影响图层的背景颜色，不影响它的背景图片，或是子图层。 */
    UIImage *image = [UIImage imageNamed:@"FM_takePhoto_guide1"];
    self.layerView3.layer.cornerRadius = 20.0;
    self.layerView3.layer.contents = (__bridge id)image.CGImage;
    
    /* 边框 border 是绘制在图层边界里面的，在所有子内容之前，也在子图层之前。*/
    self.layerView4.layer.cornerRadius = 20.0;
    self.layerView4.layer.borderWidth = 5.0;
    self.layerView4.layer.borderColor = [UIColor blueColor].CGColor;
    
    /* shadow */
    self.layerView5.layer.shadowOpacity = .5;
    self.layerView5.layer.shadowOffset = CGSizeMake(0, 3);
    self.layerView5.layer.shadowRadius = 4.0;
    // 图层的阴影继承自图层的内容的外形。为了计算出阴影的形状，CoreAnimation 会将寄宿图（包括子视图）考虑在内，从而创建一个阴影。
    self.layerView6.layer.shadowOpacity = .5;
    self.layerView6.layer.shadowOffset = CGSizeMake(0, 3);
    // 阴影根据寄宿图的轮廓来确定，我们的寄宿图有些区域是有透明效果的。
    self.layerView7.layer.shadowOpacity = .9;
    self.layerView7.layer.shadowOffset = CGSizeMake(0, 3);
    self.layerView7.layer.contents = (__bridge id)dogImage.CGImage;
    // maskToBounds = YES 时，仍然显示 shadow
    self.layerView8.layer.cornerRadius = 20.0;
    self.layerView8.layer.masksToBounds = YES;
    self.layerView8ShadowView.layer.cornerRadius = 20.0;
    self.layerView8ShadowView.layer.shadowOpacity = 0.5;
    self.layerView8ShadowView.layer.shadowOffset = CGSizeMake(0, 3.0f);
    // shadow path
    self.layerView9.layer.shadowOpacity = .5;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, self.layerView9.bounds);
    self.layerView9.layer.shadowPath = path;
    self.layerView9.layer.contents = (__bridge id)dogImage.CGImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
