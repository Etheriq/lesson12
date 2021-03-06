//
//  YTProduct+CoreDataProperties.h
//  CoreData-GH.LS12
//
//  Created by Yuriy T on 06.02.16.
//  Copyright © 2016 Yuriy T. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "YTProduct.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTProduct (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *isPurchased;
@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) NSDecimalNumber *price;
@property (nullable, nonatomic, retain) NSManagedObject *basket;

@end

NS_ASSUME_NONNULL_END
