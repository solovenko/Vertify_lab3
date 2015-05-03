//
//  ASPlayer.h
//  Lab3
//
//  Created by Артем Соловьенко on 30.04.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASPlayer : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger score;
@property (assign, nonatomic) NSInteger skips;

@end
