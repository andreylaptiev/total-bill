//
//  TipsCollectionViewCell.swift
//  TotalBill
//
//  Created by Andrii Laptiiev on 29.08.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    let percentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setConstraints()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        percentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.size.height * 0.3)
    }


    func setupView() {
        backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        layer.cornerRadius = 8.0

        addSubview(percentLabel)
    }


    func setConstraints() {
        NSLayoutConstraint.activate([
            percentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
