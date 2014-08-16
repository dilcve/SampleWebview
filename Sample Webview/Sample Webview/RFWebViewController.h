//
//  RFWebViewController.h
//  Delphos Dpvat
//
//  Created by rodrigo ferreira on 16/04/14.
//  Copyright (c) 2014 Rodrigo Ferreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RFWebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)buttonBack:(id)sender;
- (IBAction)buttonFoward:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonFoward;


@end
