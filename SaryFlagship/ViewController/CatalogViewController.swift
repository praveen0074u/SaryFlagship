//
//  CatalogViewController.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import UIKit

class CatalogViewController: UIViewController, Storyboarded {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = CatalogRepo.init()
        CatalogViewModel.init(repo: repo)
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
