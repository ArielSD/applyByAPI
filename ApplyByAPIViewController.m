//
//  ApplyByAPIViewController.m
//  applyByAPI
//
//  Created by Ariel Scott-Dicker on 6/29/16.
//  Copyright © 2016 Ariel Scott-Dicker. All rights reserved.
//

#import "ApplyByAPIViewController.h"
#import <AFNetworking.h>

@interface ApplyByAPIViewController ()

@end

@implementation ApplyByAPIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self postResume];
}

- (void)postResume {
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer new];
    NSString *perkaURLString = @"https://api.perka.com/1/communication/job/apply";
    
    NSString *base64EncodedResumeString = [self base64EncodedStringFromFilePath:@"/Users/Ariel/Desktop/Ariel Scott-Dicker.pdf"];
    NSDictionary *applicationDictionary = @{@"first_name" : @"Ariel",
                                            @"last_name" : @"Scott-Dicker",
                                            @"email" : @"ArielSD@gmail.com",
                                            @"position_id" : @"IOS",
                                            @"explanation" : @"Originally, I sent a test through Postman (Yup, that was me). Then, I encoded the PDF using NSData, and made the POST request using AFNetworking",
                                            @"projects" : @[@"https://github.com/ArielSD", @"Here's the link to my code for this application: https://goo.gl/9kLheU",@"Applying through an API is really cool, by the way"],
                                            @"source" : @"A friend of mine who's a recruiter",
                                            @"resume" : base64EncodedResumeString
                                            };
    
    [sessionManager POST:perkaURLString
              parameters:applicationDictionary
                progress:nil
                 success:^(NSURLSessionDataTask *task, id responseObject) {
                     NSLog(@"Response Object: %@", responseObject);
                     
                     NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                     NSLog(@"Response Status Code: %lu", response.statusCode);
                 }
                 failure:^(NSURLSessionDataTask *task, NSError *error) {
                     NSLog(@"Error: %@", error.localizedDescription);
                     
                     NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                     NSLog(@"Response Status Code: %lu", response.statusCode);
                 }];
}

- (NSString *)base64EncodedStringFromFilePath:(NSString *)filePath {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *base64EncodedString = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64EncodedString;
}

@end
