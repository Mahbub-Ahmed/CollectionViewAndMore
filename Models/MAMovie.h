//
//  MAMovie.h
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MAMovie : NSObject

//Movie Name
@property (nonatomic, strong) NSString *name;

//Movie genre
@property (nonatomic, strong) NSString *genre;

//Movie rating
@property (nonatomic, assign) CGFloat rating;

//Movie release year
@property (nonatomic, strong) NSString *year;

//Movie poster/image name
@property (nonatomic, strong) NSString *imageName;

@end
