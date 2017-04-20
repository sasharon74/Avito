//
//  AlertViewControllerCreator.m
//  AvitoTest
//
//  Created by Alex on 20.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "AlertViewControllerCreator.h"

static NSString *const titleAlertVC         = @"Упс!";
static NSString *const messageAlertVC       = @"Что-то пошло не так";
static NSString *const titleButtonAlertVC   = @"ОК";

@implementation AlertViewControllerCreator

+ (UIAlertController *)getAllertViewController{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:titleAlertVC
                                 message:messageAlertVC
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:titleButtonAlertVC
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    return alert;
}

@end
