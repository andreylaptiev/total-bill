//
//  PersonsCounterView.swift
//  TotalBill
//
//  Created by Andrii Laptiiev on 28.08.2022.
//

import UIKit

class PersonsCounterView: UIView {
    var counter = 0

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let counterContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.layer.cornerRadius = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let counterButtonImageConfig: UIImage.SymbolConfiguration = {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold, scale: .default)
        return imageConfig
    }()

    lazy var decrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus", withConfiguration: counterButtonImageConfig), for: .normal)
        button.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(decrementCounter), for: .touchUpInside)
        return button
    }()

    lazy var incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus", withConfiguration: counterButtonImageConfig), for: .normal)
        button.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
        return button
    }()

    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


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

        titleLabel.font = UIFont(name: "Avenir Next", size: frame.size.height * 0.13)
        counterLabel.font = UIFont(name: "Avenir Next Bold", size: frame.size.height * 0.38)
    }


    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        counterContainer.addSubview(decrementButton)
        counterContainer.addSubview(incrementButton)
        counterContainer.addSubview(counterLabel)

        addSubview(titleLabel)
        addSubview(counterContainer)
    }

    @objc func decrementCounter() {
        counter -= 1
        counterLabel.text = "\(counter)"
        if counter == 0 {
            decrementButton.isEnabled = false
        }
    }

    @objc func incrementCounter() {
        counter += 1
        counterLabel.text = "\(counter)"
        decrementButton.isEnabled = true
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),

            counterContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            counterContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            counterContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            counterContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.76),

            decrementButton.leadingAnchor.constraint(equalTo: counterContainer.leadingAnchor),
            decrementButton.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor),
            decrementButton.widthAnchor.constraint(equalToConstant: 100),
            decrementButton.heightAnchor.constraint(equalTo: counterContainer.heightAnchor),

            incrementButton.trailingAnchor.constraint(equalTo: counterContainer.trailingAnchor),
            incrementButton.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor),
            incrementButton.widthAnchor.constraint(equalToConstant: 100),
            incrementButton.heightAnchor.constraint(equalTo: counterContainer.heightAnchor),

            counterLabel.leadingAnchor.constraint(equalTo: decrementButton.trailingAnchor),
            counterLabel.trailingAnchor.constraint(equalTo: incrementButton.leadingAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor)
        ])
    }
}
