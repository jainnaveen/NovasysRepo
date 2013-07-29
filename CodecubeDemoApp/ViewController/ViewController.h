//
//  ViewController.h
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInt.h"
#import "User.h"
#import "CodecubeUtil.h"
#import "CodecubeConstant.h"
#import "UserCellView.h"


@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    UIScrollView *scrollViewUserList;
    UIAlertView *alert;
}


-(void)refreshUserList:(NSArray*)reslutArray;
@end
