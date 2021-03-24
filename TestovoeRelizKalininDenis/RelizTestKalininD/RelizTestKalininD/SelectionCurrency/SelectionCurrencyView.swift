//
//  SelectionCurrency.swift
//  RelizTestKalininD
//
//  Created by Денис on 21/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

class SelectionCurrencyView: UIViewController {
    
    private let colorUI = UIColor(red: 0.388, green: 0.353, blue: 0.918, alpha: 1)
    
    //private lazy var listCurrency = presenter.returnListCurrency()
    private var listCurrency = [String]()
    
    public var presenter: SelectionCurrencyPresenterProtocol!
    
    private let generalStack: UIStackView = {
        let stck = UIStackView()
        stck.axis = .vertical
        stck.distribution = .fill
        return stck
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cllv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cllv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cllv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setListCurrency()
        addGeneralStack()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.white
    }
    
    private func setListCurrency() {
        
        guard let list = presenter.returnListCurrency() else {
            listCurrency = ["ERROR"]
            
            return
        }
        
        listCurrency = list
    }
    
    override func viewLayoutMarginsDidChange() {
        setConstraintGenetalStack()
    }
    
    @objc private func tapCancelButton() {
        presenter.dismissChildView()
    }
    
    @objc private func tapOkButton() {
        
        presenter.chosenCurrency()
        presenter.dismissChildView()
    }
    
    private func setConstraintGenetalStack() {
        generalStack.translatesAutoresizingMaskIntoConstraints = false
        
        generalStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        generalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        generalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        generalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func addGeneralStack() {
        createTitleStack()
        createCollectionStack()
        createButtonStack()
        view.addSubview(generalStack)
    }
    
    private func createCollectionStack() {
        
            let collectionStack: UIStackView = {
                let stck = UIStackView()
                return stck
            }()
        
        collectionStack.addArrangedSubview(collectionView)
        generalStack.addArrangedSubview(collectionStack)
    }
    
    private func createTitleStack() {
        let titleStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .vertical
            stck.alignment = .center
            return stck
        }()
        
        let titleLabel: UILabel = {
           let lbl = UILabel()
            lbl.text = "Choouse a currency"
            return lbl
        }()
        
        titleStack.addArrangedSubview(titleLabel)
        generalStack.addArrangedSubview(titleStack)
    }
    
    private func createButtonStack() {
        
        let buttonStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .horizontal
            stck.distribution = .fillProportionally 
            return stck
        }()
        
        let emptyStack: UIStackView = {
            let stck = UIStackView()
            return stck
        }()
        
        let buttonCancel: UIButton = {
           let btn = UIButton()
            btn.setTitle("CANCEL", for: .normal)
            btn.setTitleColor(colorUI, for: .normal)
            btn.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
            return btn
        }()
        
        let buttonOK: UIButton = {
            let btn = UIButton()
            btn.setTitle("OK", for: .normal)
            btn.setTitleColor(colorUI, for: .normal)
            btn.addTarget(self, action: #selector(tapOkButton), for: .touchUpInside)
            return btn
        }()
        
        buttonStack.addArrangedSubview(emptyStack)
        buttonStack.addArrangedSubview(buttonCancel)
        buttonStack.addArrangedSubview(buttonOK)
        generalStack.addArrangedSubview(buttonStack)
    }

}

extension SelectionCurrencyView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width * 0.9
        let height = width * 0.07
        
        let size = CGSize(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listCurrency.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.updatCell(currency: listCurrency[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCell {
            cell.tapCell()
        }
        
        presenter.setCurrency(currency: listCurrency[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCell {
            cell.hideCell()
        }
    }
    
}

extension SelectionCurrencyView: SelectionCurrencyViewProtocol {
    
}
