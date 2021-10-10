//
//  LoginViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    //MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.text = "LogIn"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
        $0.textColor = .rgb(red: 255, green: 177, blue: 197)
    }
    
    private let loginContainer = UserInfoPutContainerView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
        
    //MARK: - Selectors

    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        containerViewSetting()
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    func addView(){
        view.addSubview(titleLabel)
        view.addSubview(loginContainer)
    }
    
    // MARK: - Corner Radius
    
    func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/4.75)
            make.left.equalToSuperview().offset(self.view.frame.width/6.25)
        }
        
        loginContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/15.04)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
    }
    
    // MARK: - ContainerView Setting
    
    func containerViewSetting(){
        loginContainer.addSubview(loginContainer.tfTitle)
        loginContainer.addSubview(loginContainer.tf)
        loginContainer.addSubview(loginContainer.divView)
        
        loginContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()
    }
}
@available(iOS 13.0, *)
struct LoginViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
