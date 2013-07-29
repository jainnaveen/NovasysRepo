//
//  User.m
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize userName,description,imageURL,imageHeight,imageWidht,isDefaultImage;

-(User*)initWithDict:(NSDictionary*)responseDict
{
    if(self = [self init]){
        self.userName = [CodecubeUtil nullValue:[responseDict valueForKey:@"username"]];
        self.imageURL = [CodecubeUtil nullValue:[[responseDict valueForKey:@"avatar_image"] valueForKey:@"url"]];
        self.imageHeight=[[CodecubeUtil nullValue:[[responseDict valueForKey:@"avatar_image"] valueForKey:@"height"]] integerValue];
        self.imageWidht=[[CodecubeUtil nullValue:[[responseDict valueForKey:@"avatar_image"] valueForKey:@"width"]] integerValue];
        self.isDefaultImage=[[CodecubeUtil nullValue:[[responseDict valueForKey:@"avatar_image"] valueForKey:@"is_default"]] boolValue];
        self.description =[CodecubeUtil nullValue:[[responseDict valueForKey:@"description"] valueForKey:@"html"]];
        
        //NSLog(@"User values/....%@/n....%@/n....%@/n....%d/n....%d/n....%d/n",userName,description,imageURL,imageHeight,imageWidht,isDefaultImage);
    }
    return self;
}

@end
