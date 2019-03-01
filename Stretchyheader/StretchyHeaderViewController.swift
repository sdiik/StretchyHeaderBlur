//
//  StretchyHeaderViewController.swift
//  Stretchyheader
//
//  Created by ahmad shiddiq on 21/02/19.
//  Copyright © 2019 ahmad shiddiq. All rights reserved.
//

import UIKit

class StretchyHeaderViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    fileprivate let cellId = "cellId"
    fileprivate let cellHeader = "headerId"
    let padding: CGFloat = 16
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor =  .white
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(ListDataView.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellHeader)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupCollectionViewLayout()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print("---------------content scroll offset ------------------")
        print(contentOffsetY)
        
        headerView?.animator.fractionComplete = abs(contentOffsetY)/100
        
        print("--------------nilai dari abs -------------")
        print(abs(contentOffsetY)/100)
    }
    
    var headerView: HeaderView?
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellHeader, for: indexPath) as? HeaderView
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 340)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width - 2 * padding, height: 50)
    }
 
}
