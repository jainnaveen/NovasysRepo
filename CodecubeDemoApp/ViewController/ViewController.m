//
//  ViewController.m
//  CodecubeDemoApp
//
//  Created by Naveen on 27/07/13.
//  Copyright (c) 2013 Naveen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //addScrollView in view controller.
    
    [self headerlabel];
    [self addScrollview];
    
    //Getting userlist server call
    [self getUserList];
}


//Server call for userlist
-(void)getUserList
{
    [self addAlertView];
    if([CodecubeUtil checkInternetConnection])
    {
    UserInt *userIntObj=[[UserInt alloc]init];
    [userIntObj createGetConnection:[NSString stringWithFormat:@"%@",USER_LIST_URL] delegate:self];
    }
}

//Header label
-(void)headerlabel
{
    UILabel *Headerlbl=[CodecubeUtil initUILabelWithFrame:CGRectMake(0,0,320,30) text:@"USER LIST" textColor:[UIColor blackColor] fontAndFamily:[UIFont boldSystemFontOfSize:14.0f]];
    Headerlbl.backgroundColor=[UIColor orangeColor];
    Headerlbl.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:Headerlbl];
}
//Add UIScrollView
-(void)addScrollview{
    scrollViewUserList = [CodecubeUtil initUIScrollViewWithFrame:CGRectMake(0, 35, self.view.frame.size.width, self.view.frame.size.height-35)];
    [self.view addSubview:scrollViewUserList];
}

//Geeting all userlist record array.
-(void)refreshUserList:(NSArray*)reslutArray
{
    [self removeAlertView];
    CGFloat y=0;
    for (NSInteger i=0; i<reslutArray.count; i++) {
        
        User *userObj =[reslutArray objectAtIndex:i];
        UserCellView *userCellViewObj =[[UserCellView alloc] initWithFrame:CGRectMake(0, y, self.view.frame.size.width, 140) user:userObj delegate:self tag:i];
        userCellViewObj.userInteractionEnabled=YES;
        [scrollViewUserList addSubview:userCellViewObj];
        y+=userCellViewObj.yMargin+10;
    }
    scrollViewUserList.contentSize=CGSizeMake(320, y+140);
}

-(void)addAlertView
{
    alert = [[UIAlertView alloc] init];
    [alert setDelegate:self];
    
    UILabel *titleLabel=[CodecubeUtil initUILabelWithFrame:CGRectMake(60,10,100,20) text:@"Loading ..." textColor:[UIColor whiteColor] fontAndFamily:[UIFont systemFontOfSize:15.0f]];
    [alert addSubview:titleLabel];
    
    // Create Activity indicator
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Adjust the indicator so it is up a few pixels from the bottom of the alert
    indicator.center = CGPointMake(102,125/2);
    [indicator startAnimating];
    
    // Add Activity indicator on AlertView
    [alert addSubview:indicator];
    [alert show];
}
/************ CUSTMISE ALERT VIEW SIZE *******************/
- (void)willPresentAlertView:(UIAlertView *)alertViewobj {
    [alert setFrame:CGRectMake(60, 170, 200, 100)];
}

-(void)removeAlertView
{
    [alert dismissWithClickedButtonIndex:0 animated:YES];
    [alert removeFromSuperview];
    alert=nil;
}


//user profile button clicked
-(void)userImageBtnClicked:(id)sender
{
    NSLog(@"Upser profile button clicked...,...!!!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
