//
//  SettingViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/11/08.
//

import UIKit
import SnapKit
import Then

class SettingViewController: UIViewController {
    //MARK: - Properties
    
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
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        
    }
    
    private func tabBarSetting(){
        tabBar.addSubview(tabBar.backgroundImage)
        tabBar.addSubview(tabBar.mainButton)
        tabBar.addSubview(tabBar.locationButton)
        tabBar.addSubview(tabBar.historyButton)
        tabBar.addSubview(tabBar.settingButton)
        
        tabBar.yellowTabBarSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SettingViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SettingViewController()
    }
}
@available(iOS 13.0, *)
struct SettingViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SettingViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
