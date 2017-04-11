//
//  MAMovieViewController.m
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MAMovieViewController.h"
#import "Helper.h"
#import "MAMovie.h"
#import "MAMovieCell.h"
#import "MAMovieCellBG.h"
#import "MAMovieDetailViewController.h"

@interface MAMovieViewController ()

@end

@implementation MAMovieViewController{
    //Contains all movies
    NSMutableArray *movies;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_movieCollection registerNib:[UINib nibWithNibName:@"MAMovieCell" bundle:nil] forCellWithReuseIdentifier:@"MOVIE_CELL"];
    
    [_movieCollection registerNib:[UINib nibWithNibName:@"MAMovieCellBG" bundle:nil] forCellWithReuseIdentifier:@"MOVIE_CELL_BG"];

    //Get all movie's from plist
    [self getMovieFromPlist];
    
    //setting navigation title
    self.navigationItem.title=@"Movies";
}

-(void)getMovieFromPlist{
    //Getting movie data from plist
    NSArray *array=[Helper getDataFromPlistNamed:@"movie"];
    
    //Initilizing movie array
    movies=[[NSMutableArray alloc]init];
    
    //Iterate through the array contains movie data
    for (NSDictionary *dict in array) {
        MAMovie *movie=[[MAMovie alloc]init];
        
        //Fatching the movie data using key value
        movie.name=[dict objectForKey:@"movie_name"];
        movie.genre=[dict objectForKey:@"genre"];
        movie.year=[dict objectForKey:@"year"];
        movie.rating=[[dict valueForKey:@"rating"] doubleValue];
        movie.imageName=[dict objectForKey:@"image_name"];
        
        //adding the movie object in movies array
        [movies addObject:movie];
    }
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //Return total number of movies
    return [movies count];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size;
    
    //Custom cell's can be of different size or same size ,you need define the proper size for each type of cell
    
    //For first four cell I am using a custom cell of width=182 & height=200
    //And setting the size for those cell
    if(indexPath.item<=3){
        size.width=182;
        size.height=200;
    }
    //And for rest using another cell of width=121 & height=130
    else{
        size.width=121;
        size.height=130;
    }
    return size;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MAMovie *movie=[movies objectAtIndex:indexPath.item];
    
    //One collection view can contain multiple custom collectio view  cell with different style & size
    //Here I am using  two different collection view cell
    //For first four cell of collection view I am using one type of cell
    if(indexPath.item<=3){
        MAMovieCellBG *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MOVIE_CELL_BG" forIndexPath:indexPath];
        cell.movieName.text=movie.name;
        cell.moviePoster.image=[UIImage imageNamed:movie.imageName];
        return cell;
    }
    //And for rest another different cell
    else{
        MAMovieCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MOVIE_CELL" forIndexPath:indexPath];
        cell.movieName.text=movie.name;
        cell.moviePoster.image=[UIImage imageNamed:movie.imageName];
        return cell;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Initilizing the detail view controller with nib
    MAMovieDetailViewController *movieDetailViewController = [[MAMovieDetailViewController alloc] initWithNibName:@"MAMovieDetailViewController" bundle:nil];
    
    //Forwarding movie information to the detail view controller
    //Here movie is a property of MAMovieDetailViewController
    movieDetailViewController.movie=[movies objectAtIndex:indexPath.item];
    
    //Adding the detailview controller to navigation controller
    [self.navigationController pushViewController:movieDetailViewController animated:YES];
}

@end
