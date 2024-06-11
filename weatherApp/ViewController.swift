//
//  ViewController.swift
//  weatherApp
//
//  Created by Егор Абрамов on 03.06.2024.
//

import UIKit

/*
 Чтобы добавить UI элемент надо:
    1. создать необходимый элемент
    2. добавить на view (view.addSubview(label))
    3. добавить необходимые ограничения(необходимо вызвать: .isActive = true)
    4. не забыть вызвать функцию
*/

final class ViewController: UIViewController {
    
    // MARK: Private UI properties
    
    private let topContentView: TopContentView = {
        let view = TopContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Задаем дефолтные данные
        topContentView.set(location: "Moscow", temperature: 21, condition: "")
    }
    
    // MARK: Private methods

    private func setupView() {
        view.backgroundColor = .black

        view.addSubview(topContentView)
        topContentView.translatesAutoresizingMaskIntoConstraints = false
        topContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        topContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34).isActive = true
        topContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}

// TODO: Вынести в отдельный файл
final class TopContentView: UIView {

    // MARK: Private UI properties

    /// Лейбл города
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 37, weight: .regular)
        
        return label
    }()
    
    /// Лейбл температуры
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 102, weight: .thin)

        return label
    }()
    
    // MARK: Internal methods
    
    /// Метод для установки значений текущей погоды
    func set(
        location: String,
        temperature: Double,
        condition: String,
        minTemp: Double = .zero,
        maxTemp: Double = .zero
    ) {
        locationLabel.text = location
        temperatureLabel.text = "\(temperature)°"
    }
    
    // MARK: Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func setupLabels() {
        // Добавляем лейблы на родительскую вью
        addSubview(locationLabel)
        addSubview(temperatureLabel)
        
        // верстаем добавленные лейблы
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: -6),
            /// Левый отступ больше правого из-за визуального искажения знаком Цельсия
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
