//
//  User.h
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodecubeUtil.h"

@interface User : NSObject
{
    NSString *userName,*imageURL,*description;
    NSInteger imageWidht,imageHeight;
    BOOL isDefaultImage;
}

@property(nonatomic) NSString *userName,*imageURL,*description;
@property(nonatomic)  NSInteger imageWidht,imageHeight;
@property(nonatomic)  BOOL isDefaultImage;

-(User*)initWithDict:(NSDictionary*)responseDict;

@end
