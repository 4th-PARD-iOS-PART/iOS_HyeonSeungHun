//
//  ModalViewController.swift
//  6th_hw_Seunghun Hyeon
//
//  Created by 현승훈 on 10/31/24.
//

import UIKit

class ModalViewController: UIViewController {
    var onSave: ((String, Int, String) -> Void)?  // 저장 후 호출될 콜백
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "나이를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let partTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "파트를 입력하세요"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장", for: .normal)
        button.addTarget(self, action: #selector(saveMember), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // UI 요소 추가 및 레이아웃 설정
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(partTextField)
        view.addSubview(saveButton)
        
        // AutoLayout 설정
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        partTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 200),
            
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            ageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageTextField.widthAnchor.constraint(equalToConstant: 200),
            
            partTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
            partTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            partTextField.widthAnchor.constraint(equalToConstant: 200),
            
            saveButton.topAnchor.constraint(equalTo: partTextField.bottomAnchor, constant: 40),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // 저장 버튼 클릭 시 호출
    @objc private func saveMember() {
        guard let name = nameTextField.text, !name.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText),
              let part = partTextField.text, !part.isEmpty else {
            print("입력 오류 발생")
            return
        }
        
        onSave?(name, age, part)  // 콜백 호출하여 데이터 전달
        dismiss(animated: true)
    }
}
