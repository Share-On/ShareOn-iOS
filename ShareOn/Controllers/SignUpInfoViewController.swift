//
//  SignUpInfoViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/10.
//

import UIKit
import SnapKit
import Then

class SignUpInfoViewController: UIViewController {
    //MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.text = "SignUp"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
        $0.textColor = .rgb(red: 159, green: 196, blue: 231)
    }
    
    private let nameContainer = UserInfoPutContainerView().then {
        $0.tfTitle.textColor = .rgb(red: 70, green: 150, blue: 225)
        $0.tfTitle.text = "Name"
        $0.tf.placeholder = "이름을 입력해주세요."
    }
    
    private let phoneNumberContainer = UserInfoPutContainerView().then{
        $0.tfTitle.textColor = .rgb(red: 70, green: 150, blue: 225)
        $0.tfTitle.text = "Phone Number"
        $0.tf.placeholder = "전화번호를 입력해주세요."
    }
    
    private let sendButton = UIButton().then {
        $0.setTitle("인증번호 전송", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 6.5, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = .rgb(red: 159, green: 196, blue: 231)
    }
    
    private let CertificationNumberContainer = UserInfoPutContainerView().then{
        $0.tfTitle.textColor = .rgb(red: 70, green: 150, blue: 225)
        $0.tfTitle.text = "Certification Number"
        $0.tf.placeholder = "인증번호를 다시 입력해주세요."
    }
    
    private let nextButton = UIButton().then {
        $0.setTitle("인증번호 확인", for: .normal)
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
    private func onTapNext(){
        let controller = AreaSelectionViewController()
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
        view.addSubview(nameContainer)
        view.addSubview(phoneNumberContainer)
        view.addSubview(sendButton)
        view.addSubview(CertificationNumberContainer)
        view.addSubview(nextButton)
        view.addSubview(goLoginButton)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        sendButton.layer.cornerRadius = self.view.frame.width/46.88
        nextButton.layer.cornerRadius = self.view.frame.width/37.5
    }
    
    // MARK: - Location
    
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.07)
            make.left.equalToSuperview().offset(self.view.frame.width/6.25)
        }
        
        nameContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/16.57)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
        
        phoneNumberContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameContainer.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
        
        sendButton.snp.makeConstraints { make in
            make.centerY.equalTo(phoneNumberContainer.tf)
            make.right.equalTo(phoneNumberContainer).inset(self.view.frame.width/177.5)
            make.width.equalToSuperview().dividedBy(7.5)
            make.height.equalToSuperview().dividedBy(50.75)
        }
        
        CertificationNumberContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneNumberContainer.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(17.65)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(CertificationNumberContainer.snp.bottom).offset(self.view.frame.height/45.11)
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
        nameContainer.addSubview(nameContainer.tfTitle)
        nameContainer.addSubview(nameContainer.tf)
        nameContainer.addSubview(nameContainer.divView)
        
        nameContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        phoneNumberContainer.addSubview(phoneNumberContainer.tfTitle)
        phoneNumberContainer.addSubview(phoneNumberContainer.tf)
        phoneNumberContainer.addSubview(phoneNumberContainer.divView)
        
        phoneNumberContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        CertificationNumberContainer.addSubview(CertificationNumberContainer.tfTitle)
        CertificationNumberContainer.addSubview(CertificationNumberContainer.tf)
        CertificationNumberContainer.addSubview(CertificationNumberContainer.divView)
        
        CertificationNumberContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpInfoViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpInfoViewController()
    }
}
@available(iOS 13.0, *)
struct SignUpInfoViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpInfoViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
