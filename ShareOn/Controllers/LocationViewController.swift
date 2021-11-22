//
//  LocationViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/11/08.
//

import UIKit
import SnapKit
import Then

class LocationViewController: UIViewController {
    //MARK: - Properties
    
    var pmValue:String = "230kwh"
    
    private let backImage = UIImageView().then {
        $0.image = UIImage(named: "ShareOn-LocationBack")
        $0.contentMode = .scaleAspectFill
    }
    
    private let homeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-HomeButton"), for: .normal)
        $0.addTarget(self, action: #selector(onTapMain), for: .touchUpInside)
    }
    
    private let minusButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-MinusButton"), for: .normal)
        $0.addTarget(self, action: #selector(onTapMinus), for: .touchUpInside)
    }
    
    private let plusButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-PlusButton"), for: .normal)
        $0.addTarget(self, action: #selector(onTapPlus), for: .touchUpInside)
    }
    
    private let allEnergy = UILabel().then {
        $0.text = "1230kwh"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
    }
    
    lazy var pmLabel = UILabel().then {
        $0.text = pmValue
        $0.dynamicFont(fontSize: 18, currentFontName: "AlfaSlabOne-Regular")
    }
    
    private let alterView = MonthOfEnergyAlterView()
    private let plusAlter = PlusEnergyAlterView()
    private let minusAlter = MinusEnergyAlterView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    private func onTapMain(){
        let controller = MainViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    private func onTapMinus(){
        pmLabel.text = "-" + pmValue
        pmLabel.textColor = .rgb(red: 70, green: 150, blue: 225)
        pmLabel.isHidden = false
    }
    
    @objc
    private func onTapPlus(){
        pmLabel.text = "+" + pmValue
        pmLabel.textColor = .rgb(red: 227, green: 75, blue: 115)
        pmLabel.isHidden = false
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        energyAlterViewSetting()
        plusAlterViewSetting()
        minusAlterViewSetting()
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(backImage)
        view.addSubview(homeButton)
        view.addSubview(minusButton)
        view.addSubview(plusButton)
        view.addSubview(allEnergy)
        view.addSubview(pmLabel)
        view.addSubview(alterView)
        view.addSubview(plusAlter)
        view.addSubview(minusAlter)

        pmLabel.isHidden = true
        alterView.isHidden = true
        plusAlter.isHidden = true
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        backImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        homeButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(12.5)
            make.height.equalToSuperview().dividedBy(25.38)
            make.right.equalToSuperview().offset(-self.view.frame.width/22.06)
            make.top.equalToSuperview().offset(self.view.frame.height/14.76)
        }
        
        minusButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(4.38)
            make.height.equalToSuperview().dividedBy(10.34)
            make.top.equalToSuperview().offset(self.view.frame.height/5.01)
            make.right.equalToSuperview().offset(-self.view.frame.width/3.97)
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(minusButton)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/8.59)
            make.right.equalTo(-self.view.frame.width/3.11)
        }
        
        allEnergy.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        pmLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(allEnergy.snp.bottom)
        }
        
        alterView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.21)
            make.height.equalToSuperview().dividedBy(5.64)
        }
        
        plusAlter.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(5.97)
        }
        
        minusAlter.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(5.97)
        }
    }

    private func energyAlterViewSetting(){
        alterView.backgroundColor = .white
        alterView.layer.cornerRadius = 10
        alterView.layer.shadowColor = UIColor.lightGray.cgColor
        alterView.layer.shadowOffset = CGSize(width: 0, height: 4)
        alterView.layer.shadowRadius = 10
        alterView.layer.shadowOpacity = 0.3
        
        alterView.addSubview(alterView.monthLabel)
        alterView.addSubview(alterView.energyGraph)
        alterView.addSubview(alterView.energyLabel)
        alterView.addSubview(alterView.cancleButton)
        alterView.addSubview(alterView.okButton)
        
        alterView.layoutSetting(sw: self.view.frame.width, sh: self.view.frame.height)
    }
    
    private func plusAlterViewSetting(){
        plusAlter.backgroundColor = .white
        plusAlter.layer.cornerRadius = 25
        plusAlter.layer.shadowColor = UIColor.lightGray.cgColor
        plusAlter.layer.shadowOffset = CGSize(width: 0, height: 4)
        plusAlter.layer.shadowRadius = 25
        plusAlter.layer.shadowOpacity = 0.3
        
        plusAlter.addSubview(plusAlter.energyTf)
        plusAlter.addSubview(plusAlter.cancleButton)
        plusAlter.addSubview(plusAlter.okButton)
        
        plusAlter.layoutSetting(sw: self.view.frame.width, sh: self.view.frame.height)
    }
    
    private func minusAlterViewSetting(){
        minusAlter.backgroundColor = .white
        minusAlter.layer.cornerRadius = 25
        minusAlter.layer.shadowColor = UIColor.lightGray.cgColor
        minusAlter.layer.shadowOffset = CGSize(width: 0, height: 4)
        minusAlter.layer.shadowRadius = 25
        minusAlter.layer.shadowOpacity = 0.3
        
        minusAlter.addSubview(minusAlter.energyTf)
        minusAlter.addSubview(minusAlter.cancleButton)
        minusAlter.addSubview(minusAlter.okButton)
        
        minusAlter.layoutSetting(sw: self.view.frame.width, sh: self.view.frame.height)
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LocationViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LocationViewController()
    }
}
@available(iOS 13.0, *)
struct LocationViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LocationViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

