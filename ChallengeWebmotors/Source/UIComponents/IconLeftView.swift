//
//  IconLeftView.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 20/12/21.
//

import UIKit
import CoreFramework

public final class IconLeftView: UIView, ViewCodeContract {
    
    // MARK: - Lifecycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func setupHierarchy() {
        self.addSubview(icon)
        self.addSubview(titleLabel)
        
    }
    
    public func setupConstraints() {
        icon
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .heightAnchor(25)
            .widthAnchor(25)
        
        titleLabel
            .topAnchor(in: self, padding: 3)
            .leftAnchor(in: icon, attribute: .right, padding: 5)
    }
    
    public func setup(title: String,
                      image: UIImage? = nil,
                      backgroundColor: UIColor) {
        icon.image = image
        titleLabel.text = title
        self.backgroundColor = backgroundColor
    }
    
 
}
