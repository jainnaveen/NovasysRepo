//
//  UserInt.h
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "ViewController.h"

@interface UserInt : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    id delegate;
}

@property(nonatomic,retain)  id delegate;

-(void)createGetConnection:(NSString *)url delegate:(id)delegateObj;
@end
