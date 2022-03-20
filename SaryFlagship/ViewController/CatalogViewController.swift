//
//  CatalogViewController.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import UIKit
import RxSwift

class CatalogViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var catalogCollectionView: UICollectionView!
    var catalogData: CatalogResponse?
    lazy var catalogViewModel: CatalogViewModel = {
        let repo = CatalogRepo()
        return CatalogViewModel(repo: repo)
    }()
    
    struct ViewIdentifiers
    {
        static let collectionViewCellSmart = "SmartCollectionViewCell"
        static let collectionViewCellGroup = "GroupCollectionViewCell"
        static let collectionViewHeader = "CatalogHeader"
    }
    enum CatalogCellType: String {
        case smart = "smart"
        case group = "group"
        case banner = "banner"
        
        var cellIdentifier: String {
            
            switch self {
            case .smart:
                return ViewIdentifiers.collectionViewCellSmart
            case .group:
                return ViewIdentifiers.collectionViewCellGroup
            case .banner:
                return ViewIdentifiers.collectionViewCellGroup
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        catalogViewModel.getCatalogs()
        registerViews()
    }
    
    func bindViewModel() {
        _ = catalogViewModel.publishCatalog
            .subscribe(onNext: { [weak self] catalogs in
                self?.catalogData = catalogs
                self?.catalogCollectionView.reloadData()
            })
    }
    
}
extension CatalogViewController {
    
    func registerViews() {
        self.catalogCollectionView.register(CatalogHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ViewIdentifiers.collectionViewHeader)
        
        let buttonLogo = UIButton(type: .custom)
        buttonLogo.setImage(UIImage(named: "logo_bar"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonLogo)
        let buttonCart = UIButton(type: .custom)
        buttonCart.setImage(UIImage(named: "cart"), for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonCart)
    }
}
extension CatalogViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return catalogData?.result?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let arrayCatalog = self.catalogData?.result?[section]
        return arrayCatalog?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let arrayCatalog = self.catalogData?.result?[indexPath.section]
        let catalog = arrayCatalog?.data?[indexPath.row]
        
        let type = self.catalogData?.result?[indexPath.section].dataType ?? ""
        let cellType = CatalogCellType.init(rawValue: type) ?? .group
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.cellIdentifier, for: indexPath)
        
        if let cellSmart = cell as? SmartCollectionViewCell {
            cellSmart.setCatalogItem(item: catalog!)
            return cellSmart
        }
        else if let cellGroup = cell as? GroupCollectionViewCell {
            cellGroup.setCatalogItem(item: catalog!)
            return cellGroup
        }
        return cell
    }
}
extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let rowCount = catalogData?.result?[indexPath.section].rowCount ?? 1
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width //- CGFloat(rowCount-1)*5
        let cellWidth = (availableWidth / CGFloat(rowCount)).rounded(.down)
        return  CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let showHeader = catalogData?.result?[indexPath.section].showTitle else { return UICollectionReusableView() }
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ViewIdentifiers.collectionViewHeader, for: indexPath) as! CatalogHeaderReusableView
            sectionHeader.label.text = showHeader ? catalogData?.result?[indexPath.section].title : ""
            return sectionHeader
        } else { //No footer in this case but can add option for that
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if let showHeader = catalogData?.result?[section].showTitle, showHeader == true {
            return CGSize(width: collectionView.frame.width, height: 40)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
