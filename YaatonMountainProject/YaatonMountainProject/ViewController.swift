//
//  ViewController.swift
//  YaatonMountainProject
//
//  Created by 이정민 on 2022/09/14.
//

import UIKit

final class ViewController: UIViewController {
    var mountains: [Mountain] = MountainData.koreanMountain
    
    private let mountainInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = UIColor.systemGray3.cgColor
        stackView.layer.cornerRadius = 30
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        stackView.spacing = 10
        return stackView
    }()
    
    private let mountainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
//        imageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
//        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mountainHeightInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let mountainDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
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
        mountainHeightInfoLabel.text = "높이 : " + mountains[0].height
        mountainDescriptionLabel.text = mountains[0].description
        mountainImageView.image = mountains[0].image
    }
    
    private func setupMountainStackView() {
//        mountainInfoStackView.backgroundColor = .green
        mountainInfoStackView.addArrangedSubview(mountainImageView)
        mountainInfoStackView.addArrangedSubview(mountainHeightInfoLabel)
        mountainInfoStackView.addArrangedSubview(mountainDescriptionLabel)
        
        view.addSubview(mountainInfoStackView)
        
        
        NSLayoutConstraint.activate([
            mountainImageView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            mountainImageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)
        ])
        
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
        if sender.selectedSegmentIndex == 0 {
            self.mountains = MountainData.koreanMountain
        } else if sender.selectedSegmentIndex == 1 {
            self.mountains = MountainData.foreignMountain
        }
        
        pickerView.reloadAllComponents()
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
        return mountains.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mountains[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select=\(row)")
        let mountain = mountains[row]
        mountainImageView.image = mountain.image
        mountainHeightInfoLabel.text = "높이 : " + mountain.height
        mountainDescriptionLabel.text = mountain.description
        
        // row 를 기반하여 리스트를 조회한 결과 값들을 mountainInfoStack에 표현
    }
}
