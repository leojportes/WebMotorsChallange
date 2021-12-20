//
//  VehiclesViewController.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 18/12/21.
//

import UIKit
import CoreFramework

final class VehiclesViewController: UIViewController {
    
    // MARK: - Private properties
    
    private(set) var vehicles: [VehicleModel] = []
    private let service: VehiclesServiceProtocol = VehiclesService()
    private var currentPage: Int = 1
    private var fetchMore: Bool = false
    
    // MARK: - Viewcode
    
    private(set) lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(VehiclesTableViewCell.self, forCellReuseIdentifier: VehiclesTableViewCell.identifier)
        table.separatorStyle = .none
        return table
    }()
    
    private func displaySpinerFooter() -> UIView {
        let footer = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: view.frame.size.width,
                                          height: 50))
        let spinner = UIActivityIndicatorView()
        spinner.center = footer.center
        footer.addSubview(spinner)
        spinner.startAnimating()
        spinner.style = .large
        return footer
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupView()
        fetchData()
    }
    
    // MARK: - Private methods
    
    private func setupNavigationController() {
        title = "Webmotors Challenge"
    }
    
    private func fetchData() {
        fetchMore = true
        service.fetchData(page: currentPage, completion: { (result) in
            DispatchQueue.main.async {
                self.tableView.tableFooterView = nil
                self.vehicles.append(contentsOf: result)
                self.tableView.reloadData()
                self.fetchMore = false
            }
        }) { (error) in
            print(error)
        }
    }
    
    private lazy var messageLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Aguarde!"
        return label
    }()
    
}

// MARK: - Extension Viewcode

extension VehiclesViewController: ViewCodeContract {
    
    func setupHierarchy() {
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.frame = view.bounds
    }
    
    func setupConfiguration() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Extension UITableView

extension VehiclesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableView.backgroundView = vehicles.count == 0 ? messageLabel : nil
        
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VehiclesTableViewCell.identifier, for: indexPath) as? VehiclesTableViewCell else { return UITableViewCell() }
        let vehiclesIndexPath = self.vehicles[indexPath.row]
        let urlImage = vehiclesIndexPath.image.replacingOccurrences(of: "http", with: "https")
        cell.setupCustomCell(image: urlImage,
                             price: vehiclesIndexPath.price,
                             model: ("\(vehiclesIndexPath.make) \(vehiclesIndexPath.model)"),
                             version: vehiclesIndexPath.version,
                             yearRelease: ("\(vehiclesIndexPath.yearFab) / \(vehiclesIndexPath.yearModel)"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vehiclesIndexPath = vehicles[indexPath.row]
        
        let controller = DetailsViewController()
        self.navigationController?.present(controller, animated: true)
        
        let urlImage = vehiclesIndexPath.image.replacingOccurrences(of: "http", with: "https")
        controller.setupCustomView(image: urlImage,
                                   model: ("\(vehiclesIndexPath.make) \(vehiclesIndexPath.model)"),
                                   version: vehiclesIndexPath.version,
                                   yearRelese: String("\(vehiclesIndexPath.yearFab) / \(vehiclesIndexPath.yearModel)"),
                                   color: vehiclesIndexPath.color,
                                   km: String(vehiclesIndexPath.km))
    }
    
    
    
}

// MARK: - Extension UIScrollView

extension VehiclesViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height-100-scrollView.frame.size.height {
            if !fetchMore && self.vehicles.count != 0 {
                self.tableView.tableFooterView = self.displaySpinerFooter()
                self.currentPage += 1
                self.fetchData()
            }
            
        }
    }
}

