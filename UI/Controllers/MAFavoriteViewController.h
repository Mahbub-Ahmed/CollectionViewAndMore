//
//  MAFavoriteViewController.h
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAFavoriteViewController : UIViewController

//UICollection for favorite animated movie
@property (strong, nonatomic) IBOutlet UICollectionView *favAnimieCollection;

//UICollection for favorite action movie 
@property (strong, nonatomic) IBOutlet UICollectionView *favActionCollection;

@end
