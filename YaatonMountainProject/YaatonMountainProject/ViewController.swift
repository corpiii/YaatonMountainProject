//
//  ViewController.swift
//  YaatonMountainProject
//
//  Created by 이정민 on 2022/09/14.
//

import UIKit

final class ViewController: UIViewController {
    var list = ["한라산","백두산","북한산"]
    
    private let mountainInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        
        return stackView
    }()
    
    private let mountainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hala")
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        return imageView
    }()
    
    private let mountainHeightInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "높이 : "
        return label
    }()
    
    private let mountainDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "정보"
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["국내산", "외국산"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    private let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
        setupMountainStackView()
        setupSegmentControl()
        setupPickerView()
    }
    
    private func setupInitialView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupMountainStackView() {
        mountainInfoStackView.backgroundColor = .green
        mountainInfoStackView.addArrangedSubview(mountainImageView)
        mountainInfoStackView.addArrangedSubview(mountainHeightInfoLabel)
        mountainInfoStackView.addArrangedSubview(mountainDescriptionLabel)
        
        view.addSubview(mountainInfoStackView)
        
        NSLayoutConstraint.activate([
            mountainInfoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mountainInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mountainInfoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mountainInfoStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func setupSegmentControl() {
        view.addSubview(segmentControl)
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: mountainInfoStackView.bottomAnchor, constant: 20),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentControl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            segmentControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        ])
        
        segmentControl.addTarget(self, action: #selector(didValueChanged), for: .valueChanged)
    }
    
    @objc func didValueChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        // 배열을 국내산/ 외국산 스위칭
        
    }
    
    private func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor),
//            pickerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select=\(row)")
        // row 를 기반하여 리스트를 조회한 결과 값들을 mountainInfoStack에 표현
    }
}
