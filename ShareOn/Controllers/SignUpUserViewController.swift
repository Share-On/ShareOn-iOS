//
//  SignUpUserViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/10.
//

import UIKit
import SnapKit
import Then

class SignUpUserViewController: UIViewController {
    //MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.text = "SignUp"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
        $0.textColor = .rgb(red: 159, green: 196, blue: 231)
    }
    
    private let idContainer = UserInfoPutContainerView().then {
        $0.tfTitle.textColor = .rgb(red: 70, green: 150, blue: 225)
    }
    
    private let checkButton = UIButton().then {
        $0.setTitle("중복 확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 6.5, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = .rgb(red: 159, green: 196, blue: 231)
    }
    
    private let passwordContainer = UserInfoPutContainerView().then{
        $0.tfTitle.textColor = .rgb(red: 70, green: 150, blue: 225)
        $0.tfTitle.text = "Password"
        $0.tf.placeholder = "비밀번호를 입력해주세요."
        $0.tf.isSecureTextEntry = true
    }
    
    private let showPasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "ShareOn-eye"), for: .normal)
        $0.addTarget(self, action: #selector(onTapEyeButton), for: .touchUpInside)
    }
    
    private let composeLabel = UILabel().then {
        $0.text = "비밀번호는 5~20자의 영문 소문자와 1개 이상의 숫자로 구성해주세요!"
        $0.textColor = .rgb(red: 178, green: 178, blue: 178)
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let passwordCheckContainer = UserInfoPutContainerView().then{
        $0.tfTitle.textColor = .rgb(red: 70, green: 150, blue: 225)
        $0.tfTitle.text = "Password Check"
        $0.tf.placeholder = "비밀번호를 다시 입력해주세요."
        $0.tf.isSecureTextEntry = true
    }
    
    private let showPasswordCheckButton = UIButton().then {
        $0.setImage(UIImage(named: "ShareOn-eye"), for: .normal)
        $0.addTarget(self, action: #selector(onTapCheckEyeButton), for: .touchUpInside)
    }
    
    private let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .rgb(red: 159, green: 196, blue: 231)
        $0.titleLabel?.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapNext), for: .touchUpInside)
    }
    
    private let goLoginButton = UIButton().then {
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.setTitleColor(.rgb(red: 178, green: 178, blue: 178), for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
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
    
    @objc
    private func onTapCheckEyeButton(){
        if passwordCheckContainer.tf.isSecureTextEntry == true {
            passwordCheckContainer.tf.isSecureTextEntry = false
            showPasswordCheckButton.setImage(UIImage(named: "ShareOn-closedEye"), for: .normal)
        } else {
            passwordCheckContainer.tf.isSecureTextEntry = true
            showPasswordCheckButton.setImage(UIImage(named: "ShareOn-eye"), for: .normal)
        }
    }
    
    @objc
    private func onTapNext(){
        let controller = SignUpInfoViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    private func onTapLogin(){
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
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
        view.addSubview(idContainer)
        view.addSubview(checkButton)
        view.addSubview(passwordContainer)
        view.addSubview(showPasswordButton)
        view.addSubview(composeLabel)
        view.addSubview(passwordCheckContainer)
        view.addSubview(showPasswordCheckButton)
        view.addSubview(nextButton)
        view.addSubview(goLoginButton)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        checkButton.layer.cornerRadius = self.view.frame.width/46.88
        nextButton.layer.cornerRadius = self.view.frame.width/37.5
    }
    
    // MARK: - Location
    
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.07)
            make.left.equalToSuperview().offset(self.view.frame.width/6.25)
        }
        
        idContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/16.57)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
        
        checkButton.snp.makeConstraints { make in
            make.centerY.equalTo(idContainer.tf)
            make.right.equalTo(idContainer).inset(self.view.frame.width/177.5)
            make.width.equalToSuperview().dividedBy(7.5)
            make.height.equalToSuperview().dividedBy(50.75)
        }
        
        passwordContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idContainer.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordContainer.tf)
            make.right.equalTo(passwordContainer.divView).inset(self.view.frame.width/187.5)
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(73.82)
        }
        
        composeLabel.snp.makeConstraints { make in
            make.left.equalTo(passwordContainer)
            make.top.equalTo(passwordContainer.snp.bottom).offset(self.view.frame.height/135.33)
        }
        
        passwordCheckContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordContainer.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
        
        showPasswordCheckButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordCheckContainer.tf)
            make.right.equalTo(passwordCheckContainer.divView).inset(self.view.frame.width/187.5)
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(73.82)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordCheckContainer.snp.bottom).offset(self.view.frame.height/45.11)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(19.80)
        }
        
        goLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.frame.height/11.94)
            make.width.equalToSuperview().dividedBy(3.12)
            make.height.equalToSuperview().dividedBy(54.13)
        }
    }
    
    // MARK: - ContainerView Setting
    
    private func containerViewSetting(){
        idContainer.addSubview(idContainer.tfTitle)
        idContainer.addSubview(idContainer.tf)
        idContainer.addSubview(idContainer.divView)
        
        idContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        passwordContainer.addSubview(passwordContainer.tfTitle)
        passwordContainer.addSubview(passwordContainer.tf)
        passwordContainer.addSubview(passwordContainer.divView)
        
        passwordContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        passwordCheckContainer.addSubview(passwordCheckContainer.tfTitle)
        passwordCheckContainer.addSubview(passwordCheckContainer.tf)
        passwordCheckContainer.addSubview(passwordCheckContainer.divView)
        
        passwordCheckContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpUserViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpUserViewController()
    }
}
@available(iOS 13.0, *)
struct SignUpUserViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpUserViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
