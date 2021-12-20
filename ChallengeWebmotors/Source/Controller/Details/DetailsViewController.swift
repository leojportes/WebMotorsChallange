//
//  DetailsViewController.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 20/12/21.
//

import UIKit
import CoreFramework

final class DetailsViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let customView = DetailsView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view = customView
    }
    
    // MARK: - Methods
    
    func setupCustomView(image: String = String.empty,
                         model: String,
                         version: String,
                         yearRelese: String,
                         color: String,
                         km: String) {
        
        customView.setupDetailView(image: image,
                                   model: model,
                                   version: version,
                                   yearRelese: yearRelese,
                                   color: color,
                                   km: km)
    }
}
