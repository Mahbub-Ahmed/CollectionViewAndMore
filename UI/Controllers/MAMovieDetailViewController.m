//
//  MAMovieDetailViewController.m
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MAMovieDetailViewController.h"

@interface MAMovieDetailViewController ()

@end

@implementation MAMovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Setting the forwarded movie property to the detail view controller property
    
    _moviePoster.image=[UIImage imageNamed:_movie.imageName];
    _backView.image=[UIImage imageNamed:_movie.imageName];
    _name.text=_movie.name;
    
    //Converting float to NSString and taking 1 point after decimal
    _rating.text=[NSString stringWithFormat:@"%.1f", _movie.rating];
    _year.text=_movie.year;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
