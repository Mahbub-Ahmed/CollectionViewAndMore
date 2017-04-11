//
//  MASeasonViewController.m
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MASeasonViewController.h"
#import "MASeasonCell.h"
#import "MASeason.h"
#import "Helper.h"

@interface MASeasonViewController ()

@end

@implementation MASeasonViewController{
    NSMutableArray *seasons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Registring the nib cell for collection view
    [_seasonCollection registerNib:[UINib nibWithNibName:@"MASeasonCell" bundle:nil] forCellWithReuseIdentifier:@"SEASON_CELL"];
    
    //Get season data from plist
    [self getSeasonFromPlist];
    
    //Setting navigation title
    self.navigationItem.title=@"Season";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)getSeasonFromPlist{
    //Getting season data from plist
    NSArray *array=[Helper getDataFromPlistNamed:@"season"];
    
    //Initilizing season array
    seasons=[[NSMutableArray alloc]init];
    
    //Iterate through all season data
    for (NSDictionary *dict in array) {
        MASeason *season=[[MASeason alloc]init];
        season.name=[dict objectForKey:@"season_name"];
        season.imageName=[dict objectForKey:@"image_name"];
        
        //adding season object seasons array
        [seasons addObject:season];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //Total number of season
    return [seasons count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MASeason *season=[seasons objectAtIndex:indexPath.item];
    //Setting the season cell
    MASeasonCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SEASON_CELL" forIndexPath:indexPath];
    cell.name.text=season.name;
    cell.seasonPoster.image=[UIImage imageNamed:season.imageName];
    return cell;
}
@end
