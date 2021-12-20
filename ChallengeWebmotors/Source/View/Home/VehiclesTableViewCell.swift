//
//  VehiclesTableViewCell.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 18/12/21.
//

import UIKit
import CoreFramework

final class VehiclesTableViewCell: UITableViewCell, ViewCodeContract {
    
    // MARK: - Static properties
    
    static let identifier = "VehiclesTableViewCell"
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageVehicle: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var priceView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.WebmotorsColor.wineMedium
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var markLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .darkGray
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yearReleaseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var openIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Image.open.rawValue)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    // MARK: - Methods viewcode
    
    func setupHierarchy() {
        addSubview(baseView)
        baseView.addSubview(imageVehicle)
        baseView.addSubview(priceView)
        priceView.addSubview(priceLabel)
        baseView.addSubview(markLabel)
        baseView.addSubview(versionLabel)
        baseView.addSubview(yearReleaseLabel)
        baseView.addSubview(openIcon)
    }
    
    func setupConstraints() {
        baseView
            .topAnchor(in: contentView, padding: 10)
            .leftAnchor(in: contentView, padding: 10)
            .rightAnchor(in: contentView, padding: 10)
            .bottomAnchor(in: contentView, padding: 10)

        imageVehicle
            .topAnchor(in: baseView)
            .leftAnchor(in: baseView)
            .rightAnchor(in: baseView)
            .heightAnchor(230)
        
        priceView
            .topAnchor(in: imageVehicle, attribute: .bottom, padding: -20)
            .leftAnchor(in: baseView)
            .widthAnchor(190)
            .heightAnchor(50)
        
        priceLabel
            .centerY(in: priceView)
            .leftAnchor(in: priceView, padding: 10)
            .heightAnchor(25)
        
        markLabel
            .topAnchor(in: priceView, attribute: .bottom, padding: 5)
            .leftAnchor(in: baseView, padding: 10)
            .heightAnchor(25)
        
        versionLabel
            .topAnchor(in: markLabel, attribute: .bottom, padding: 5)
            .leftAnchor(in: baseView, padding: 10)
            .rightAnchor(in: baseView, padding: 10)
        
        yearReleaseLabel
            .topAnchor(in: versionLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: baseView, padding: 10)
        
        openIcon
            .bottomAnchor(in: baseView, padding: 10)
            .rightAnchor(in: baseView, padding: 10)
            .widthAnchor(25)
            .heightAnchor(25)
            
    }
    
    func setupConfiguration() {
        selectionStyle = .none
        
        baseView.layer.cornerRadius = 8
        baseView.clipsToBounds = true
        baseView.backgroundColor = UIColor.WebmotorsColor.grayLightest
        imageVehicle.clipsToBounds = true
        imageVehicle.contentMode = .scaleAspectFill
        imageVehicle.roundCorners(cornerRadius: 8, typeCorners: [.topLeft, .topRight])
        
        priceView.roundCorners(cornerRadius: 25, typeCorners: [.topRight, .bottomRight])
        
    }
    
    // MARK: - Public methods
    
    public func setupCustomCell(image: String = String.empty,
                                price: String = String.empty,
                                model: String = String.empty,
                                version: String = String.empty,
                                yearRelease: String = String.empty) {
        imageVehicle.load(urlString: image)
        priceLabel.text = ("R$ \(price)")
        markLabel.text = (model)
        versionLabel.text = version
        yearReleaseLabel.text = yearRelease
    }
    
}
