//
//  MainViewController.swift
//  TotalBill
//
//  Created by Andrii Laptiiev on 28.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "money")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and press \"Calculate\""
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        button.layer.cornerRadius = 8.0
        button.tintColor = .white
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        return button
    }()

    let billValueView = BillValueView()
    let personsCounterView = PersonsCounterView()
    let tipsView = TipsView()


    override func viewDidLoad() { // loading starts here
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)

        setupViews()
        setConstraints()
        tap()
    }


    func setupViews() { // setup objects gere
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(billValueView)
        view.addSubview(personsCounterView)
        view.addSubview(tipsView)
        view.addSubview(calculateButton)
    }


    func tap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }


    @objc func hideKeyboard() {
        view.endEditing(true)
    }


    @objc func calculate() {
        guard let billText = billValueView.textField.text, let billValue = Int(billText) else {
            descriptionLabel.text = "Enter correct bill value"
            descriptionLabel.textColor = .red
            return
        }

        if personsCounterView.counter == 0 {
            descriptionLabel.text = "Add some people"
            descriptionLabel.textColor = .red
            return
        }

        let result = (billValue + billValue * tipsView.tipPercent / 100) / personsCounterView.counter
        descriptionLabel.text = "\(result)$ from each person"
        descriptionLabel.textColor = .black
    }
}


extension MainViewController {
    func setConstraints() { // objects location
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),

            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.43),

            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            billValueView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            billValueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            billValueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            billValueView.heightAnchor.constraint(equalToConstant: 105),

            personsCounterView.topAnchor.constraint(equalTo: billValueView.bottomAnchor, constant: 15),
            personsCounterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsCounterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsCounterView.heightAnchor.constraint(equalToConstant: 105),

            tipsView.topAnchor.constraint(equalTo: personsCounterView.bottomAnchor, constant: 15),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalToConstant: 105),

            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 15),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
