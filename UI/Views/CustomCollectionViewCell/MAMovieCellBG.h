//
//  MAMovieCellBG.h
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAMovieCellBG : UICollectionViewCell

//Moive image
@property (strong, nonatomic) IBOutlet UIImageView *moviePoster;

//Moive name
@property (strong, nonatomic) IBOutlet UILabel *movieName;

@end
