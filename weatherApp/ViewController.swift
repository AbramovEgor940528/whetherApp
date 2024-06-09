//
//  ViewController.swift
//  weatherApp
//
//  Created by Егор Абрамов on 03.06.2024.
//

import UIKit

class ViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Новый текст Новый текст Новый текстНовый текстНовый текст"
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .red
        view.layer.backgroundColor = UIColor.blue.cgColor
        
        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true

// еще
//        NSLayoutConstraint.activate(
//            [
//             label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//             label.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
//             label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
//            ]
//        )
    }
    /*
     чтобы добавиь UI элемент надо:
            1. создать необходимый элемент
            2. добавить на view (view.addSubview(label))
            3. добавить необходимые ограничения(необходимо вызвать: .isActive = true)
            4. не забыть вызвать функцию
     */
}

