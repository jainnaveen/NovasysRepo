//
//  UserCellView.h
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "User.h"

@interface UserCellView : UIView
{
    UIView *cellBg;
    CGFloat y;
    CGFloat yMargin,extraFeedHeight;
    User *userObj;
    id delegate;
    NSInteger tag;
}
@property(nonatomic) CGFloat yMargin,extraFeedHeight;
- (id)initWithFrame:(CGRect)frame user:(User *)user delegate:(id)delegareObj tag:(NSInteger )tagValue;

@end
