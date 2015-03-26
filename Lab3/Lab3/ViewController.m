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

@synthesize LabelToCheck = _LabelToCheck;
@synthesize enterTextField = _enterTextField;

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
    

    

//    NSMutableArray *readed;
//    
//    for(NSMutableString *element in lines) {
//        readed = [NSMutableArray arrayWithArray:[element componentsSeparatedByString: @";"]];
//        NSLog(@"%@", readed);
//    }

    
    
//    NSMutableString *str = [[NSMutableString alloc] init];
//    
//    for (NSUInteger i = 0; i < 10; i++) {
//        [str appendString:@"Artem is cool!\n"];
//    }
//    [str writeToFile:@"/tmp/cool.txt" atomically:YES
//            encoding:NSUTF8StringEncoding error:NULL];
//    NSLog(@"done writing /tmp/cool.txt");

    
    NSFileManager *filemgr;
    filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: @"db.txt" ] == YES)
        NSLog (@"Файл присуствует");
    else
        NSLog (@"Файл не найден");
}

- (IBAction)submitButton:(id)sender {
    NSMutableString *enteredNameOfCity = [NSMutableString stringWithFormat: _enterTextField.stringValue, nil];
    
    NSMutableString* fileName = [NSMutableString stringWithString:@"/tmp/db.txt"];
    NSMutableString *fileString = [NSMutableString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error: NULL];
    
    NSMutableArray *lines = [NSMutableArray arrayWithArray:[fileString componentsSeparatedByString:@"\n"]];
    BOOL isFinden = NO;
    NSMutableString *resultString;
    
    for (NSMutableString *element in lines) {
        if ([element isEqualTo:enteredNameOfCity]){
            isFinden = YES;
            resultString = element;
        }
//        NSLog(@"%@",element);
    }
    if (isFinden){
        _LabelToCheck.stringValue = [NSMutableString stringWithFormat:@"YES, %@",resultString];
    } else {
        _LabelToCheck.stringValue = [NSMutableString stringWithFormat:@"NO", nil];
    }
}

@end
