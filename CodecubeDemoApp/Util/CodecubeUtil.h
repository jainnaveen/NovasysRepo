//
//  CodecubeUtil.h
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodecubeUtil : NSObject

+(id)nullValue:(id)val;
+(BOOL)checkInternetConnection;

+(UIScrollView *)initUIScrollViewWithFrame:(CGRect)frame;
+(UIImageView*)initUIImageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName;
+(UILabel *)initUILabelWithFrame:(CGRect)frame text:(NSString*)textObj textColor:(UIColor *)textColorObj fontAndFamily:(UIFont *)fontAndStyleOBj;
+(UIButton*)initCustomUIButtonWithFrame:(CGRect)frame target:(id)targetObj action:(SEL)actionObj setTitle:(NSString*)titleObj;

+(float)resizeLableToFitWith:(UILabel*)lbl;
+(float)expectedHeightWithUILabel:(UILabel*)lblObj;
@end
