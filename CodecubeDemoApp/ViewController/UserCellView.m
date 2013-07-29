//
//  UserCellView.m
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import "UserCellView.h"

@implementation UserCellView
@synthesize yMargin,extraFeedHeight;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame user:(User *)user delegate:(id)delegareObj tag:(NSInteger )tagValue
{
    self = [super initWithFrame:frame];
    if (self) {
        tag =tagValue;
        // Initialization code
        delegate =delegareObj;
        userObj = user;
        [self userCellBackground];
        [self addImage];
        [self addLabel];
    }
    return self;
}

/******** User Profile Cell **********/
-(void)userCellBackground{
    
    cellBg =[[UIView alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width-10,100)];
    cellBg.userInteractionEnabled=YES;
    cellBg.layer.borderWidth=0.8;
    cellBg.layer.borderColor=[UIColor colorWithWhite:0.835 alpha:1.000].CGColor;
    [self addSubview:cellBg];
}

/******** User Profile image  **********/
-(void)addImage{
    
    userObj.imageURL = [userObj.imageURL stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSURL *url = [NSURL URLWithString:userObj.imageURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImageView *imageView =[CodecubeUtil initUIImageViewWithFrame:CGRectMake(5, 5, 60, 60) imageName:nil];
    [imageView setImage:[UIImage imageWithData:data]];
    [cellBg addSubview:imageView];
    
    UIButton *userImageBtn =[CodecubeUtil initCustomUIButtonWithFrame:CGRectMake(5, 5, 60, 60) target:delegate action:@selector(userImageBtnClicked:) setTitle:nil];
    userImageBtn.tag=tag;
    [cellBg addSubview:userImageBtn];
    
}

/******** User Description label   **********/
-(void)addLabel{
    
    y=0;
    //Feed label
    
    UILabel *feedTitlelbl=[CodecubeUtil initUILabelWithFrame:CGRectMake(75,0, self.frame.size.width-90,30) text:[NSString stringWithFormat:@"%@",userObj.userName] textColor:[UIColor blackColor] fontAndFamily:[UIFont boldSystemFontOfSize:12.0f]];
    [cellBg addSubview:feedTitlelbl];
    
    UIWebView *webviewObj=[[UIWebView alloc]initWithFrame:CGRectMake(65,30,self.frame.size.width-90,50)];
     webviewObj.scrollView.bounces=NO;
     webviewObj.scrollView.userInteractionEnabled=NO;
    
    NSString *html = [NSString stringWithFormat:@"<html><body bgcolor=\"#BFBFBF\">%@</body></html>",userObj.description];
    
    [webviewObj loadHTMLString:html baseURL:nil];
    [cellBg addSubview:webviewObj];
    
    yMargin+=cellBg.frame.size.height;
    
   
}

@end
