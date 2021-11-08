//
//  MainViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/12.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    //MARK: - Properties
    
    private let notificationButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-Notification"), for: .normal)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "Usage"
        $0.textColor = .rgb(red: 178, green: 238, blue: 158)
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
    }
    
    private let tabBar = TabBar()
    
    private let currentLabel = UILabel().then {
        $0.text = "현재 저장된 총 전기량 확인"
        $0.textColor = .rgb(red: 113, green: 218, blue: 103)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let dividedView = UIView().then {
        $0.backgroundColor = .rgb(red: 178, green: 238, blue: 158)
    }
    
    private let currentEnergy = UILabel().then {
        $0.text = "230kwh"
        $0.textColor = .rgb(red: 113, green: 218, blue: 103)
        $0.dynamicFont(fontSize: 18, currentFontName: "AlfaSlabOne-Regular")
    }
    
    private let dateLabel1 = UILabel().then {
        $0.text = "Utill September, 29"
        $0.textColor = .rgb(red: 142, green: 142, blue: 142)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let saveLabel = UILabel().then {
        $0.text = "현재 사용되고 있는 전기량 확인"
        $0.textColor = .rgb(red: 113, green: 218, blue: 103)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let dividedView2 = UIView().then {
        $0.backgroundColor = .rgb(red: 178, green: 238, blue: 158)
    }
    
    private let saveEnergy = UILabel().then {
        $0.text = "200kwh"
        $0.textColor = .rgb(red: 113, green: 218, blue: 103)
        $0.dynamicFont(fontSize: 18, currentFontName: "AlfaSlabOne-Regular")
    }
    
    private let dateLabel2 = UILabel().then {
        $0.text = "Utill September, 29"
        $0.textColor = .rgb(red: 142, green: 142, blue: 142)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
        tabBarSetting()
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(notificationButton)
        view.addSubview(tabBar)
        view.addSubview(titleLabel)
        view.addSubview(currentLabel)
        view.addSubview(dividedView)
        view.addSubview(currentEnergy)
        view.addSubview(dateLabel1)
        view.addSubview(saveLabel)
        view.addSubview(dividedView2)
        view.addSubview(saveEnergy)
        view.addSubview(dateLabel2)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        notificationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/14.76)
            make.right.equalToSuperview().offset(-self.view.frame.width/17.05)
            make.width.equalToSuperview().dividedBy(12.5)
            make.height.equalToSuperview().dividedBy(27.07)
        }
        
        tabBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10.02)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.06)
            make.left.equalToSuperview().offset(self.view.frame.width/6.36)
        }
        
        currentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/20.3)
            make.left.equalTo(dividedView)
        }
        
        dividedView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.42)
            make.height.equalTo(self.view.frame.height/812)
            make.top.equalTo(currentLabel.snp.bottom).offset(self.view.frame.height/81.2)
        }
        
        currentEnergy.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/4.63)
            make.top.equalTo(dividedView.snp.bottom).offset(self.view.frame.height/9.02)
        }
        
        dateLabel1.snp.makeConstraints { make in
            make.centerX.equalTo(currentEnergy)
            make.top.equalTo(currentEnergy.snp.bottom).offset(self.view.frame.height/270.67)
        }
        
        saveLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel1.snp.bottom).offset(self.view.frame.height/9.02)
            make.left.equalTo(dividedView)
        }
        
        dividedView2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.42)
            make.height.equalTo(self.view.frame.height/812)
            make.top.equalTo(saveLabel.snp.bottom).offset(self.view.frame.height/81.2)
        }
        
        saveEnergy.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/4.63)
            make.top.equalTo(dividedView2.snp.bottom).offset(self.view.frame.height/9.02)
        }
        
        dateLabel2.snp.makeConstraints { make in
            make.centerX.equalTo(saveEnergy)
            make.top.equalTo(saveEnergy.snp.bottom).offset(self.view.frame.height/270.67)
        }
    }
    
    private func tabBarSetting(){
        tabBar.addSubview(tabBar.backgroundImage)
        tabBar.addSubview(tabBar.mainButton)
        tabBar.addSubview(tabBar.locationButton)
        tabBar.addSubview(tabBar.historyButton)
        tabBar.addSubview(tabBar.settingButton)
        
        tabBar.greenTabBarSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct MainViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MainViewController()
    }
}
@available(iOS 13.0, *)
struct MainViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MainViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

