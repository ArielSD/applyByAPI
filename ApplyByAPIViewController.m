//
//  ApplyByAPIViewController.m
//  applyByAPI
//
//  Created by Ariel Scott-Dicker on 6/29/16.
//  Copyright © 2016 Ariel Scott-Dicker. All rights reserved.
//

#import "ApplyByAPIViewController.h"

@interface ApplyByAPIViewController ()

@end

@implementation ApplyByAPIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *resumeFilePath = @"/Users/Ariel/Desktop/Ariel Scott-Dicker.pdf";
    NSData *resumeData = [NSData dataWithContentsOfFile:resumeFilePath];
    
    NSString *resumeBase64EncodedString = [resumeData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    NSLog(@"Base 64 String: %@", resumeBase64EncodedString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
