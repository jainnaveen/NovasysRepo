//
//  UserInt.m
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import "UserInt.h"

@implementation UserInt
@synthesize delegate;


-(void)createGetConnection:(NSString *)url delegate:(id)delegateObj
{
    //creating request
    self.delegate = delegateObj;
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    
    //creating asynchronous connection
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSString *receivedString=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
         //Deserialising response
         NSDictionary *results=[NSJSONSerialization JSONObjectWithData:[receivedString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
         if (error)
         {
                 //displaying error message
                 UIAlertView *connectionTimeoutAlert=[[UIAlertView alloc]initWithTitle:@"Connection Failure" message:@"Connection Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                 [connectionTimeoutAlert show];
         }
         else
         {
             //calling parsing method
             [self performSelector:@selector(userGetCallResponse:) withObject:results];
         }
         
     }];
    
}

//Getting response for USer API.
-(void)userGetCallResponse:(NSDictionary*)response
{
    
    NSMutableArray *allUserObjects=[[NSMutableArray alloc]init];
    NSArray *resultsArray=[response objectForKey:@"data"];
    
    //getting station objects
    for (NSDictionary *dataDict in resultsArray)
    {
        User *userObj=[[User alloc]initWithDict:[dataDict valueForKey:@"user"]];
        [allUserObjects addObject:userObj];
        
        if([[dataDict allKeys] containsObject:@"repost_of"])
        {
            User *userObj=[[User alloc]initWithDict:[[dataDict valueForKey:@"repost_of"] valueForKey:@"user"]];
            [allUserObjects addObject:userObj];
        }
    }
    
    //passing results
    [self.delegate refreshUserList:allUserObjects];
}

@end
