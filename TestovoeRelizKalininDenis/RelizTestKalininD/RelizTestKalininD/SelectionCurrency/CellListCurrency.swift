//
//  CellListCurrency.swift
//  RelizTestKalininD
//
//  Created by Денис on 21/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    private let cellGeneralStack: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.distribution = .equalCentering
        return stk
    }()
    
    let labelCurrency: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        return lbl
    }()
    
    let activityImage: UIImageView = {
        let img = UIImage(named: "Oval pust")
        let imgV = UIImageView(image: img)
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        createCellStack()
        contentView.addSubview(cellGeneralStack)
        
        cellGeneralStack.translatesAutoresizingMaskIntoConstraints = false
        cellGeneralStack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellGeneralStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellGeneralStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        cellGeneralStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCellStack() {
        
        let cellEmptyStack: UIStackView = {
            let stk = UIStackView()
            return stk
        }()
        
        cellGeneralStack.addArrangedSubview(activityImage)
        cellGeneralStack.addArrangedSubview(labelCurrency)
        cellGeneralStack.addArrangedSubview(cellEmptyStack)
        }
    
    public func updatCell(currency: String) {
        print (currency)
        
        labelCurrency.text = currency
    }
    
    public func tapCell() {
        activityImage.image = UIImage(named: "Oval")
        let view = UIImageView(image: UIImage(named: "Oval tap")!)
        activityImage.addSubview(view)
        view.center = activityImage.center
    }
    
    public func hideCell() {
        activityImage.image = UIImage(named: "Oval pust")
        activityImage.subviews.last?.removeFromSuperview()
    }
}

