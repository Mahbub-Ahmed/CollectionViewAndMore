# CollectionViewAndMore

<!---
Created by Mahbub Ahmed on 4/11/2017
Copyright © 2017 Mahbub Ahmed. All rights reserved.
-->

[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)]()
[![Programming Language](https://img.shields.io/badge/language-objective--c-ff69b4.svg)]()
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](/LICENSE.md)

The focus of this project is to show how to implement tab bar controller with navigation controller and it also cover few mostly used feature of UICollectionView. 

## Project Covers:

-	[Tab Bar With Navigation Controller Using Nib](#tab-bar-with-navigation-controller-using-nib)  
-	[UICollectionView](#uicollectionview)  
	-	[Custom Cell](#custom-cell)
	-	[CollectionView With Multiple Type of Cell](#collectionview-with-multiple-type-of-cell)
	-	[VIewController With Multiple CollectionView](#viewcontroller-with-multiple-collectionview) 
-	[Plist](#plist)  


## Tab Bar With Navigation Controller Using nib
Tab bar and navigation controller is two most important feature of ios app which is being used widely with one another .In story board it is very easy to implement by embedding in on your view controller but it's little tricky still simple when using nib file. You can do this in your app delegate method ```applicationDidFinishLaunching```.
* [Tab Bar With Navigation controller](https://github.com/Mahbub-Ahmed/CollectionViewAndMore/blob/master/CollectionViewAndMore/AppDelegate.m)


## UICollectionView
CollectionView are used to present data in a grid-like arrangement but it is much more powerful than a grid or row/column view. Moreover scrolling of collection view can be change to horizontal or vertical
### Custom Cell
Similar to TableView, CollectionView can have custom cell.  
[Custom CollectionView Cell](https://github.com/Mahbub-Ahmed/CollectionViewAndMore/tree/master/UI/Views/CustomCollectionViewCell)

### CollectionView With Multiple Type of Cell  
Collection view can have multiple different type of custom cell which can have different style and size.  
###### You can define the cell size programmatically depending on the cell and its indexPath as bellow :
```objective-c
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size;
    if(indexPath.item<=3){
        size.width=CELL_WIDTH;
        size.height=CELL_HEIGHT;
    }
    else{
        size.width=OTHER_CELL_WIDTH;
        size.height=OTHER_CELL_HEIGHT;
    }
    return size;
}
``` 
###### You can use indexPath to control when to display which cell 
```objective-c
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MAMovie *movie=[movies objectAtIndex:indexPath.item];
	
    if(indexPath.item<=3){
			//Cell configraton
    }
    else{
        // Other Cell
    }
}
```
### VIewController With Multiple CollectionView
Each view controller can have multiple collection view but you cannot implement delegate and datasource method separately for each collection view. This basically means you have to use one delegate methord for all collection view
* [Multiple collectionView](https://github.com/Mahbub-Ahmed/CollectionViewAndMore/blob/master/UI/Controllers/MAFavoriteViewController.m)

# Plist
Plist (property list) is one of the easiest ways to store static data in a file without using any database being used to store application data. 


###### Bellow code is being used to get the plist path, its data and storing the data from dictionary to relevant array 
```objective-c


    //Plist path need to get information
    NSString *path = [[NSBundle mainBundle] pathForResource:name="PLIST_NAME" ofType:@"plist"];
    NSArray *plistDataArray= [[NSArray alloc] initWithContentsOfFile:path];

	
	//access data from array of dictionary
    for (NSDictionary *movie in plistDataArray) {
	
       NSLog(@"%@",[movie objectForKey:@"movie_name"]);
       NSLog(@"%@",[movie objectForKey:@"genre"]);
    }

```


## License
CollectionViewAndMore is licensed under the terms of the MIT License. For full details please see the [LICENSE](https://github.com/Mahbub-Ahmed/CollectionViewAndMore/blob/master/LICENSE)

