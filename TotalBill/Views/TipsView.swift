//
//  TipsView.swift
//  TotalBill
//
//  Created by Andrii Laptiiev on 29.08.2022.
//

import UIKit

class TipsView: UIView {
    let tips = ["0%", "10%", "15%", "20%"]
    var tipPercent = 0

    let layout = UICollectionViewLayout()

    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Tips"
        title.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
        title.font = UIFont(name: "Avenir Next", size: 14)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let collectionView: UICollectionView = {
       let collectionViewLayout = UICollectionViewFlowLayout()
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
       collectionView.translatesAutoresizingMaskIntoConstraints = false
       return collectionView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setConstraints()
        setDelagates()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(collectionView)
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "tipsCell")
    }


    func setDelagates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension TipsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tips.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tipsCell", for: indexPath) as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.percentLabel.text = tips[indexPath.row]
        return cell
    }
}


extension TipsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
            case 1:
                tipPercent = 10
            case 2:
                tipPercent = 15
            case 3:
                tipPercent = 20
            default:
                tipPercent = 0
         }
        print(tipPercent)
    }
}


extension TipsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.5, height: collectionView.frame.height)
    }
}


extension TipsView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
