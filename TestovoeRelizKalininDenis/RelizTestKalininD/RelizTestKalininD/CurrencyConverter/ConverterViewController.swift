//
//  ConverterViewController.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    private let colorUI = UIColor(red: 0.388, green: 0.353, blue: 0.918, alpha: 1)
    private let imageVector = UIImage(named: "Vector 20")
    
    var presenter: ConverterPresenterProtocol!
    
    private let generalStack: UIStackView = {
        let stck = UIStackView()
        stck.axis = .vertical
        stck.distribution = .fill
        return stck
    }()
    
    private let inputText: UITextField = {
        let txt = UITextField()
        txt.text = ""
        txt.keyboardType = .numbersAndPunctuation;
        return txt
    }()
    
    private let resultLabel: UILabel = {
        let txt = UILabel()
        txt.text = ""
        return txt
    }()
    
    private let selectionSendButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("RUB", for: .normal)
        btn.addTarget(self, action: #selector(tapSendSelectCurrency), for: .touchUpInside)
        return btn
    }()
    
    private let selectionGetButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("EUR", for: .normal)
        btn.addTarget(self, action: #selector(tapGetSelectCurrency), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getRequestCurrencyRated()
        addGeneralStack()
        renameNavigBar()
        
        selectionGetButton.setTitleColor(colorUI, for: .normal)
        selectionSendButton.setTitleColor(colorUI, for: .normal)
        
        selectionGetButton.setImage(imageVector, for: .normal)
        selectionSendButton.setImage(imageVector, for: .normal)
        selectionGetButton.castlingTitleImage()
    }
    
    override func viewLayoutMarginsDidChange() {
        setConstraintGenetalStack()
    }
    
    @objc private func actionBurgerNavButton() {
        print ("navigButton tap")
    }
    
    @objc private func tapSendSelectCurrency(_ sender: Any) {
        presenter.tapSendListCurrency()
    }
    
    @objc private func tapGetSelectCurrency(_ sender: Any) {
        presenter.tapGetListCurrency()
    }
    
    @objc private func tapConvertButton() {
        
        guard let send = (inputText.text as NSString?)?.floatValue else {
            return
        }
        presenter.tapConvertButton(send: send)
    }
    
    private func setConstraintGenetalStack() {
        generalStack.translatesAutoresizingMaskIntoConstraints = false
        
        generalStack.topAnchor.constraint(equalTo: navigationController!.navigationBar.bottomAnchor, constant: 50).isActive = true
        generalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        generalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        generalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
    private func renameNavigBar() {
        
        let burgerButton: UIBarButtonItem = {
            let image = UIImage(named: "Menu")
            let btn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(actionBurgerNavButton))
            return btn
        }()
        
        navigationController?.navigationBar.barTintColor = colorUI
        navigationController?.navigationBar.topItem?.title = "Currency converter"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationItem.leftBarButtonItem = burgerButton
    }
    
    private func addGeneralStack() {
        
        createSendStak()
        createExchangeStak()
        createGetStak()
        createEmptyStack()
        view.addSubview(generalStack)
    }
    
    private func createSendStak() {
        
        let sendStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .vertical
            return stck
        }()
        
        let topStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .vertical
            return stck
        }()
        
        let headingLabel: UILabel = {
           let lbl = UILabel()
            lbl.font = lbl.font.withSize(13)
            lbl.alpha = 0.5
            lbl.text = "You send"
            return lbl
        }()
        
        let bottomStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .horizontal
            return stck
        }()
        
        topStack.addArrangedSubview(headingLabel)
        bottomStack.addArrangedSubview(inputText)
        bottomStack.addArrangedSubview(selectionSendButton)
        
        sendStack.addArrangedSubview(topStack)
        sendStack.addArrangedSubview(bottomStack)
        
        generalStack.addArrangedSubview(sendStack)
    }
    
    private func createExchangeStak() {
        
        let exchangeStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .vertical
            return stck
        }()
        
        let exchangeButton: UIButton = {
            let btn = UIButton()
            let image = UIImage(named: "Frame 4")
            btn.setImage(image, for: .normal)
            btn.addTarget(self, action: #selector(tapConvertButton), for: .touchUpInside)
            return btn
        }()
        
        exchangeStack.addArrangedSubview(exchangeButton)
        generalStack.addArrangedSubview(exchangeStack)
    }
    
    private func createGetStak() {
        
        let getStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .vertical
            return stck
        }()
        
        let topStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .horizontal
            return stck
        }()
        
        let headingLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "They get"
            lbl.font = lbl.font.withSize(13)
            lbl.alpha = 0.5
            return lbl
        }()
        
        let bottomStack: UIStackView = {
            let stck = UIStackView()
            stck.axis = .horizontal
            return stck
        }()
        
        topStack.addArrangedSubview(headingLabel)
        bottomStack.addArrangedSubview(resultLabel)
        bottomStack.addArrangedSubview(selectionGetButton)
        
        getStack.addArrangedSubview(topStack)
        getStack.addArrangedSubview(bottomStack)
        
        generalStack.addArrangedSubview(getStack)
    }
    
    private func createEmptyStack() {
        let emptyStack: UIStackView = {
            let stck = UIStackView()
            stck.spacing = 0
            return stck
        }()
        
        generalStack.addArrangedSubview(emptyStack)
    }
    
}

extension ConverterViewController: ConverterViewProtocol {
    
    func openListCurrency(child: UIViewController,transition: UIViewControllerTransitioningDelegate) {
        child.view.layer.cornerRadius = 10
        child.transitioningDelegate = transition
        child.modalPresentationStyle = .custom
        present(child, animated: true)
    }
    
    func dismisListCurrency() {
        dismiss(animated: true, completion: nil)
    }
    
    func setResultConvert(result: Float) {
        
        let stringResult = String(format: "%.2f", result)
        resultLabel.text = stringResult
    }
    
    func setTitleButton(title: String, sendGet: SendGetButton) {
        
        switch sendGet {
        case .send:
            selectionSendButton.setTitle(title, for: .normal)
        case .get :
            selectionGetButton.setTitle(title, for: .normal)
        }
    }
}


extension UIButton {
    
    func castlingTitleImage() {
        let buttonWidth = self.frame.width
        let imageWidth = self.imageView!.frame.width
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonWidth-imageWidth, bottom: 0, right: -(buttonWidth-imageWidth))
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: 0, right: imageWidth)
    }
    
}
