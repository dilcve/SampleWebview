//
//  RFWebViewController.m
//  Delphos Dpvat
//
//  Created by rodrigo ferreira on 16/04/14.
//  Copyright (c) 2014 Rodrigo Ferreira. All rights reserved.
//

#import "RFWebViewController.h"
#import <AFHTTPRequestOperation.h>



@interface RFWebViewController ()

@end

@implementation RFWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]];
    [self.webView loadRequest:request];
    [self verifyNavigationButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonBack:(id)sender {
    [self.webView goBack];
    //[self parse];
}

- (IBAction)buttonFoward:(id)sender {
    [self.webView goForward];
}

-(id)init{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"WebView";
        
    }
    return self;
}

-(void)verifyNavigationButtons{
    [self.buttonBack setEnabled:[self.webView canGoBack]];
    [self.buttonFoward setEnabled:[self.webView canGoForward]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"acabou de carregar");
    [self verifyNavigationButtons];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"ocorreu um erro %@",[error debugDescription]);
    [self verifyNavigationButtons];
}

-(void)parse {
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://dl.dropboxusercontent.com/u/96414002/json_test.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Parse Successful: %@", responseObject);
        NSLog(@"nome %@ ",[responseObject objectForKey:@"name"]);
        NSLog(@"url %@ ",[responseObject objectForKey:@"profile_url"]);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", [error localizedDescription]);
        //Code for Failure Handling
        
    }];
    
    [operation start];
    
}

@end
