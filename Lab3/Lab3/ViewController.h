//
//  ViewController.h
//  Lab3
//
//  Created by Артем Соловьенко on 26.03.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController {

}

@property __weak IBOutlet NSTextField *myLabel;
@property __weak IBOutlet NSTextField *myTextField;


-(IBAction)showYourName:(id)sender;

@end

