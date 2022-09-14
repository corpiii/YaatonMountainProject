//
//  ViewController.swift
//  YaatonMountainProject
//
//  Created by 이정민 on 2022/09/14.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "테스트 텍스트"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
        setupMainStackView()
    }
    
    private func setupInitialView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
