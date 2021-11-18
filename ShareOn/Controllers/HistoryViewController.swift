//
//  HistoryViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/11/08.
//

import UIKit
import SnapKit
import Then

class HistoryViewController: UIViewController {
    //MARK: - Properties
    
    private let homeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-HomeButton"), for: .normal)
        $0.addTarget(self, action: #selector(onTapMain), for: .touchUpInside)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "Transmission\nHistory"
        $0.textColor = .rgb(red: 255, green: 177, blue: 197)
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
        $0.numberOfLines = 2
    }
    
    private let nothingLabel = UILabel().then {
        $0.text = "아직 공유내역이 없어요!"
        $0.dynamicFont(fontSize: 18, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let nothingImage = UIImageView().then {
        $0.image = UIImage(named: "ShareOn-nothing")
    }
    
    private let tabBar = TabBar().then {
        $0.mainButton.addTarget(self, action: #selector(onTapMain), for: .touchUpInside)
        $0.locationButton.addTarget(self, action: #selector(onTapLocation), for: .touchUpInside)
        $0.historyButton.addTarget(self, action: #selector(onTapHistory), for: .touchUpInside)
        $0.settingButton.addTarget(self, action: #selector(onTapSetting), for: .touchUpInside)
    }
    
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
    private func onTapLocation(){
        let controller = LocationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    private func onTapHistory(){
        let controller = HistoryViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    private func onTapSetting(){
        let controller = SettingViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        tabBarSetting()
        addView()
        cornerRadius()
        location()
        
        nothingLabel.isHidden = true
        nothingImage.isHidden = true
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(tabBar)
        view.addSubview(homeButton)
        view.addSubview(titleLabel)
        view.addSubview(nothingLabel)
        view.addSubview(nothingImage)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        tabBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5.31)
        }
        
        homeButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(12.5)
            make.height.equalToSuperview().dividedBy(25.38)
            make.right.equalToSuperview().offset(-self.view.frame.width/22.06)
            make.top.equalToSuperview().offset(self.view.frame.height/14.76)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.88)
            make.left.equalToSuperview().offset(self.view.frame.width/5.07)
        }
        
        nothingLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/35.30)
        }
        
        nothingImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nothingLabel.snp.bottom).offset(self.view.frame.height/9.50)
            make.width.equalToSuperview().dividedBy(1.51)
            make.height.equalToSuperview().dividedBy(3.36)
        }
    }
    
    private func tabBarSetting(){
        tabBar.addSubview(tabBar.backgroundImage)
        tabBar.addSubview(tabBar.mainButton)
        tabBar.addSubview(tabBar.locationButton)
        tabBar.addSubview(tabBar.historyButton)
        tabBar.addSubview(tabBar.settingButton)
        
        tabBar.pinkTabBarSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct HistoryViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        HistoryViewController()
    }
}
@available(iOS 13.0, *)
struct HistoryViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            HistoryViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

