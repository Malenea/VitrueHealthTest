//
//  ViewController.swift
//  VitrueHealthTest
//
//  Created by Olivier Conan on 19/12/2020.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base view controller
class ViewController: UIViewController {
    
    /// Components
    private lazy var textFieldView: UITextField = makeTextFieldView()
    private lazy var resultLabel: UILabel = makeResultLabel()
    
    /// Items
    private var isValid: Bool = false {
        didSet {
            resultLabel.textColor = isValid ? UIColor.green.withAlphaComponent(0.5) : UIColor.red.withAlphaComponent(0.5)
            resultLabel.text = "\(isValid)"
        }
    }

    /// Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSelf()
        setupLayout()
    }

    deinit {
        print("Deinit called")
    }

}

// MARK: - Base view controller setup
extension ViewController {
    
    func setupSelf() {
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        view.add(textFieldView, resultLabel)
        
        NSLayoutConstraint.activate([
            textFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            textFieldView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            resultLabel.bottomAnchor.constraint(equalTo: textFieldView.topAnchor, constant: -8),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func makeTextFieldView() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        textField.textColor = UIColor.lightGray.withAlphaComponent(0.5)
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        textField.returnKeyType = .done
        textField.delegate = self
        return textField
    }
    
    func makeResultLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return label
    }
    
}

// MARK: - Text field delegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        isValid = Palindrome.isThisPalindrome(text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
