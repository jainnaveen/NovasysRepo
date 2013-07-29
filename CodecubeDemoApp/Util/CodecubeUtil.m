//
//  CodecubeUtil.m
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import "CodecubeUtil.h"
#import "Reachability.h"

@implementation CodecubeUtil

// Check Null Value
+(id)nullValue:(id)val{
    if(val == [NSNull null])
        return nil;
    else
        return val;
}

// check for internet connection
+(BOOL)checkInternetConnection
{
    // check for internet connection
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)
    {
        //no connection error message
        UIAlertView *internetConnectionAlert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"No Internet Connection  Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [internetConnectionAlert show];
        return NO;
    }else
    return YES;
}


/************ UIScrollView **********/
+(UIScrollView *)initUIScrollViewWithFrame:(CGRect)frame{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:frame];
    return scrollView;
}

/************* UIIamge View ***********/
+(UIImageView*)initUIImageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName {
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:frame];
    imageView.image =[UIImage imageNamed:imageName];
    return imageView;
}

/*********** UILabel *************/
+(UILabel *)initUILabelWithFrame:(CGRect)frame text:(NSString*)textObj textColor:(UIColor *)textColorObj fontAndFamily:(UIFont *)fontAndStyleOBj{
    UILabel *lbl =[[UILabel alloc] initWithFrame:frame];
    lbl.backgroundColor=[UIColor clearColor];
    lbl.textColor=textColorObj;
    lbl.text=textObj;
    lbl.font=fontAndStyleOBj;
    return lbl;
}

/********* UIButton Custom ***********/

+(UIButton*)initCustomUIButtonWithFrame:(CGRect)frame target:(id)targetObj action:(SEL)actionObj setTitle:(NSString*)titleObj {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:targetObj
               action:actionObj
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:titleObj forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    button.frame = frame;
    return button;
}

/************ Resizing Lable Height ***********/
+(float)resizeLableToFitWith:(UILabel*)lbl {
    float height = [self expectedHeightWithUILabel:lbl];
    CGRect newFrame = [lbl frame];
    newFrame.size.height = height;
    [lbl setFrame:newFrame];
    return newFrame.origin.y + newFrame.size.height;
}
/************ Expected Lable Height ***********/
+(float)expectedHeightWithUILabel:(UILabel*)lblObj{
    [lblObj setNumberOfLines:0];
    [lblObj setLineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize maximumLabelSize = CGSizeMake(lblObj.frame.size.width,9999);
    
    CGSize expectedLabelSize = [[lblObj text] sizeWithFont:[lblObj font]
                                         constrainedToSize:maximumLabelSize
                                             lineBreakMode:[lblObj lineBreakMode]];
    return expectedLabelSize.height;
}
@end
