//
//  MAMovieDetailViewController.h
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAMovie.h"
@interface MAMovieDetailViewController : UIViewController

//Property to to receive the forwarded movie object from movie view controller
@property (strong,nonatomic) MAMovie *movie;

//Background image view
@property (strong, nonatomic) IBOutlet UIImageView *backView;

//Movie poster/image
@property (strong, nonatomic) IBOutlet UIImageView *moviePoster;

//Movie name
@property (strong, nonatomic) IBOutlet UILabel *name;

//Movie rating
@property (strong, nonatomic) IBOutlet UILabel *rating;

//Movie year
@property (strong, nonatomic) IBOutlet UILabel *year;



@end
