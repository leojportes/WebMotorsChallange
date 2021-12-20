//
//  DetailsView.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 20/12/21.
//

import UIKit
import CoreFramework

final class DetailsView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    
    var didTapClose: Action?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var detailView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view.isOpaque = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = .zero
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yearReleaseLabel: IconLeftView = {
        let label = IconLeftView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vehicleColor: IconLeftView = {
        let label = IconLeftView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var kmVehicle: IconLeftView = {
        let label = IconLeftView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hpVehicle: IconLeftView = {
        let label = IconLeftView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Methods viewcode
    
    func setupHierarchy() {
        self.addSubview(detailView)
        detailView.addSubview(imageView)
        detailView.addSubview(modelLabel)
        detailView.addSubview(versionLabel)
        detailView.addSubview(yearReleaseLabel)
        detailView.addSubview(vehicleColor)
        detailView.addSubview(kmVehicle)
        detailView.addSubview(hpVehicle)
    }
    
    func setupConstraints() {
    
        detailView
            .topAnchor(in: self, padding: 180)
            .leftAnchor(in: self, padding: 50)
            .rightAnchor(in: self, padding: 50)
            .bottomAnchor(in: self, padding: 180)
        
        imageView
            .topAnchor(in: detailView, padding: 10)
            .leftAnchor(in: detailView, padding: 10)
            .rightAnchor(in: detailView, padding: 10)
            .heightAnchor(200)
        
        modelLabel
            .topAnchor(in: imageView, attribute: .bottom, padding: 15)
            .leftAnchor(in: detailView, padding: 10)
        
        versionLabel
            .topAnchor(in: modelLabel, attribute: .bottom, padding: 5)
            .leftAnchor(in: detailView, padding: 10)
            .rightAnchor(in: detailView, padding: 30)
        
        yearReleaseLabel
            .topAnchor(in: versionLabel, attribute: .bottom, padding: 5)
            .leftAnchor(in: detailView, padding: 10)
            .heightAnchor(30)
        
        kmVehicle
            .topAnchor(in: yearReleaseLabel, attribute: .bottom, padding: 5)
            .leftAnchor(in: detailView, padding: 10)
            .heightAnchor(30)
        
        vehicleColor
            .topAnchor(in: kmVehicle, attribute: .bottom, padding: 5)
            .leftAnchor(in: detailView,padding: 10)
            .heightAnchor(30)
        
        hpVehicle
            .topAnchor(in: vehicleColor, attribute: .bottom, padding: 5)
            .leftAnchor(in: detailView,padding: 10)
            .heightAnchor(30)
    }
    
    func setupConfiguration() {
        self.backgroundColor = .clear
        detailView.roundCorners(cornerRadius: 10, all: true)
        imageView.roundCorners(cornerRadius: 10, all: true)
    }
    
    public func setupDetailView(image: String = String.empty,
                                model: String,
                                version: String,
                                yearRelese: String,
                                color: String,
                                km: String) {
        let words = version.split{ $0.isWhitespace }.map{ String($0)}
        imageView.load(urlString: image)
        modelLabel.text = model
        versionLabel.text = version
        yearReleaseLabel.setup(title: yearRelese, image: UIImage(named: "ic_fab"), backgroundColor: .clear)
        vehicleColor.setup(title: color, image: UIImage(named: "ic_pallet"), backgroundColor: .clear)
        kmVehicle.setup(title: km, image: UIImage(named: "ic_km"), backgroundColor: .clear)
        hpVehicle.setup(title: ("\(words[0]) \(words[1])"), image: UIImage(named: "ic_motor"), backgroundColor: .clear)
        
    }

}
