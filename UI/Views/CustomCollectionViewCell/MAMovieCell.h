//
//  MAMovieCell.h
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAMovieCell : UICollectionViewCell

//Movie image/poster outlet
@property (strong, nonatomic) IBOutlet UIImageView *moviePoster;

//Movie name
@property (strong, nonatomic) IBOutlet UILabel *movieName;

@end
