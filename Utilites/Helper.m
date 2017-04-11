//
//  Helper.m
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 2/12/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(NSArray*)getDataFromPlistNamed:(NSString *)name{
    
    //Getting path for the specified plist
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    
    //Getting the data from plist using the path
    return [[NSArray alloc] initWithContentsOfFile:path];
}


@end
