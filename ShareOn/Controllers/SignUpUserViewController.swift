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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
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
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        checkButton.layer.cornerRadius = self.view.frame.width/46.88
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
    }
    
    // MARK: - ContainerView Setting
    
    private func containerViewSetting(){
        idContainer.addSubview(idContainer.tfTitle)
        idContainer.addSubview(idContainer.tf)
        idContainer.addSubview(idContainer.divView)
        
        idContainer.tfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
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
