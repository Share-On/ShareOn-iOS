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
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(tabBar)
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

