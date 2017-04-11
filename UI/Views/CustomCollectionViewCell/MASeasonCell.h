//
//  MASeasonCell.h
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/7/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASeasonCell : UICollectionViewCell

//Season image
@property (strong, nonatomic) IBOutlet UIImageView *seasonPoster;

//Season name
@property (strong, nonatomic) IBOutlet UILabel *name;

@end
