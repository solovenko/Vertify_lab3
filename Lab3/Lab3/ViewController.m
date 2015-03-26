//
//  ViewController.m
//  Lab3
//
//  Created by Артем Соловьенко on 26.03.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize myLabel = _myLabel;
@synthesize myTextField = _myTextField;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(IBAction)showYourName:(id)sender {
    
    NSString* inputString = _myTextField.stringValue;
    if ([inputString isEqualToString:@""]) {
        _myLabel.stringValue = [NSString stringWithFormat: @"Hello!", nil];
    } else {
            _myLabel.stringValue = [NSString stringWithFormat: @"Hello, %@!",inputString];
    }
}

@end
