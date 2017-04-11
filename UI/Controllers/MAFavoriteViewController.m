//
//  MAFavoriteViewController.m
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MAFavoriteViewController.h"
#import "Helper.h"
#import "MAMovie.h"
#import "MAMovieCell.h"
#import "MAMovieDetailViewController.h"

@interface MAFavoriteViewController ()

@end

@implementation MAFavoriteViewController{
    NSMutableArray *animatedMovie;
    NSMutableArray *actionMovie;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Registring the nib cell for the releated collection view
    [_favAnimieCollection registerNib:[UINib nibWithNibName:@"MAMovieCell" bundle:nil] forCellWithReuseIdentifier:@"MOVIE_CELL"];
    [_favActionCollection registerNib:[UINib nibWithNibName:@"MAMovieCell" bundle:nil] forCellWithReuseIdentifier:@"MOVIE_CELL"];
    
    //Get movie data from plist
    [self getMovieFromPlist];
    
    //Setting navigation title
    self.navigationItem.title=@"Favorite";
    
}

-(void)getMovieFromPlist{
    //Getting data from plist
    NSArray *array=[Helper getDataFromPlistNamed:@"movie"];
    
    //Initilizing the mutable array
    animatedMovie=[[NSMutableArray alloc]init];
    actionMovie=[[NSMutableArray alloc]init];
    
    for (NSDictionary *dict in array) {
        MAMovie *movie=[[MAMovie alloc]init];
        
        //Fatching data from dictionary
        movie.name=[dict objectForKey:@"movie_name"];
        movie.genre=[dict objectForKey:@"genre"];
        movie.year=[dict objectForKey:@"year"];
        movie.rating=[[dict valueForKey:@"rating"] doubleValue];
        movie.imageName=[dict objectForKey:@"image_name"];
        
        //If the movie genre is animated then storing it to animated movie array
        if([movie.genre isEqual:@"Animated"]){
            [animatedMovie addObject:movie];
        }
        //else it is an action movie storing it to action movie array
        else if([movie.genre isEqual:@"Action"]){
            [actionMovie addObject:movie];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
    
    //Here for both view i am showing only six cell's
    //If you wish to show different number of cell's for different view , you can do it like bellow commented lins

    /*if(collectionView==self.favActionCollection){
        return 6;
    }
    else if (collectionView==self.favActionCollection){
        return 9;
    }*/
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size;
    //setting the custom cell size ,it also can be done in BI/nib file
    size.width=121;
    size.height=130;
    return size;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MAMovie *movie;
    MAMovieCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MOVIE_CELL" forIndexPath:indexPath];
    //View controller may contains multiple collection view but it can have only one delegate method for same purpose
    //so in that method we nedd to know in which collection view we are in now, in order to show the correct data/information for that collection view
    
    //If the collection view is for action movie , use the array holds action movie
    if(collectionView==self.favActionCollection){
        
        movie=[actionMovie objectAtIndex:indexPath.item];
     }
    //Or if it's for animation movie, use animation array
     else {
         movie=[animatedMovie objectAtIndex:indexPath.item];
     }
    
    //setting the cell property
    cell.movieName.text=movie.name;
    cell.moviePoster.image=[UIImage imageNamed:movie.imageName];
    
    return cell;

}

//Action for when user select a cell
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Initilizing the detail view controller with nib
    MAMovieDetailViewController *movieDetailViewController = [[MAMovieDetailViewController alloc] initWithNibName:@"MAMovieDetailViewController" bundle:nil];
    
    //Forwarding movie information to the detail view controller
    //Here movie is a property of MAMovieDetailViewController
    
    //If the selected cell is from collection view that contains action movies
    if(collectionView==self.favActionCollection){
        //forwarding the selected cell information to detail view controller
         movieDetailViewController.movie=[actionMovie objectAtIndex:indexPath.item];
    }
    //else the selected cell is from animatied movie collection view
    else {
        //forwarding the selected cell information to detail view controller
        movieDetailViewController.movie=[animatedMovie objectAtIndex:indexPath.item];
    }
    //Adding the detailview controller to navigation controller
    [self.navigationController pushViewController:movieDetailViewController animated:YES];
    
}

@end
