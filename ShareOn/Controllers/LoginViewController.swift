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
    
    private let passwordContainer = UserInfoPutContainerView().then{
        $0.tfTitle.text = "Password"
        $0.tf.placeholder = "비밀번호를 입력해주세요."
        $0.tf.isSecureTextEntry = true
    }
    
    private let showPasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "ShareOn-eye"), for: .normal)
        $0.addTarget(self, action: #selector(onTapEyeButton), for: .touchUpInside)
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .rgb(red: 255, green: 177, blue: 197)
        $0.titleLabel?.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
    }

    private let goSignUpButton = UIButton().then {
        $0.setTitle("계정이 없으신가요?", for: .normal)
        $0.setTitleColor(.rgb(red: 178, green: 178, blue: 178), for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
        
    //MARK: - Selectors

    @objc
    private func onTapEyeButton(){
        if passwordContainer.tf.isSecureTextEntry == true {
            passwordContainer.tf.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(named: "ShareOn-closedEye"), for: .normal)
        } else {
            passwordContainer.tf.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(named: "ShareOn-eye"), for: .normal)
        }
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        containerViewSetting()
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(titleLabel)
        view.addSubview(loginContainer)
        view.addSubview(passwordContainer)
        view.addSubview(showPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(goSignUpButton)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        loginButton.layer.cornerRadius = self.view.frame.width/37.5
    }
    
    // MARK: - Location
    
    private func location(){
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
        
        passwordContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginContainer.snp.bottom).offset(self.view.frame.height/58)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordContainer.tf)
            make.right.equalTo(passwordContainer.divView).inset(self.view.frame.width/187.5)
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(73.82)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordContainer.snp.bottom).offset(self.view.frame.height/45.11)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(19.80)
        }
        
        goSignUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.frame.height/11.94)
            make.width.equalToSuperview().dividedBy(3.75)
            make.height.equalToSuperview().dividedBy(54.13)
        }
    }
    
    // MARK: - ContainerView Setting
    
    private func containerViewSetting(){
        loginContainer.addSubview(loginContainer.tfTitle)
        loginContainer.addSubview(loginContainer.tf)
        loginContainer.addSubview(loginContainer.divView)
        
        loginContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        passwordContainer.addSubview(passwordContainer.tfTitle)
        passwordContainer.addSubview(passwordContainer.tf)
        passwordContainer.addSubview(passwordContainer.divView)
        
        passwordContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
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
