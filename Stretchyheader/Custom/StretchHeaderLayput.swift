//
//  StretchHeaderLayput.swift
//  Stretchyheader
//
//  Created by ahmad shiddiq on 28/02/19.
//  Copyright © 2019 ahmad shiddiq. All rights reserved.
//

import UIKit

class StretchHeaderLayput: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0{
                
                guard let collectionView = collectionView else {
                    return
                }
                let contentOffsetY = collectionView.contentOffset.y
                print("-----------nilai contentOffset ----------------")
                print(contentOffsetY)
                
                if contentOffsetY >  0{
                    return
                }
                
                let width = collectionView.frame.width
                let height = attributes.frame.height - contentOffsetY
                
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
