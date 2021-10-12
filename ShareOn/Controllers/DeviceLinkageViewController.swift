//
//  DeviceLinkageViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/11.
//

import UIKit
import SnapKit
import Then

class DeviceLinkageViewController: UIViewController {
    //MARK: - Properties
    
    lazy var deviceName:String = "ShareOn_Ec0929"
    
    private let titleLabel = UILabel().then {
        $0.text = "Device linkage"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
        $0.textColor = .rgb(red: 159, green: 196, blue: 231)
    }
    
    lazy var deviceInfoView = DeviceView().then {
        $0.name.text = deviceName
    }
    
    private let nextButton = UIButton().then {
        $0.setTitle("장치연동", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .rgb(red: 159, green: 196, blue: 231)
        $0.titleLabel?.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapNext), for: .touchUpInside)
    }
    
    private let linkFinishImage = UIImageView().then {
        $0.image = UIImage(named: "ShareOn-LinkFinish")
    }
    
    private let mainButton = UIButton().then {
        $0.setTitle("메인으로 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .rgb(red: 159, green: 196, blue: 231)
        $0.titleLabel?.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapMain), for: .touchUpInside)
    }
    
    lazy var deviceNameLabel = UILabel().then {
        $0.text = deviceName
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .rgb(red: 93, green: 163, blue: 229)
    }
    
    private let linkedLabel = UILabel().then {
        $0.text = "디바이스가 연결되었습니다!"
        $0.textColor = .rgb(red: 112, green: 112, blue: 112)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    private func onTapNext(){
        deviceInfoView.isHidden = true
        nextButton.isHidden = true
        deviceNameLabel.isHidden = false
        linkedLabel.isHidden = false
        linkFinishImage.isHidden = false
        mainButton.isHidden = false
    }
    
    @objc
    private func onTapMain(){
        let controller = MainViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        deviceViewSetting()
        addView()
        cornerRadius()
        location()
        
        deviceNameLabel.isHidden = true
        linkedLabel.isHidden = true
        linkFinishImage.isHidden = true
        mainButton.isHidden = true
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(titleLabel)
        view.addSubview(deviceInfoView)
        view.addSubview(nextButton)
        view.addSubview(linkFinishImage)
        view.addSubview(deviceNameLabel)
        view.addSubview(linkedLabel)
        view.addSubview(mainButton)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        deviceInfoView.layer.borderWidth = 1
        deviceInfoView.layer.borderColor = UIColor.rgb(red: 229, green: 229, blue: 229).cgColor
        deviceInfoView.layer.cornerRadius = self.view.frame.width/15
        deviceInfoView.deviceImage.layer.cornerRadius = self.view.frame.width/5
        
        nextButton.layer.cornerRadius = self.view.frame.width/37.5
        mainButton.layer.cornerRadius = self.view.frame.width/37.5
    }
    
    // MARK: - Location
    
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.07)
            make.left.equalToSuperview().offset(self.view.frame.width/6.25)
        }
        
        deviceInfoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/17.28)
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(2.42)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(deviceInfoView.snp.bottom).offset(self.view.frame.height/16.92)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(19.80)
        }
        
        linkFinishImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/6.01)
            make.width.equalToSuperview().dividedBy(1.07)
            make.height.equalToSuperview().dividedBy(3.12)
        }
        
        deviceNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/73.82)
            make.left.equalToSuperview().offset(self.view.frame.width/6.36)
        }
        
        linkedLabel.snp.makeConstraints { make in
            make.top.equalTo(deviceNameLabel)
            make.left.equalTo(deviceNameLabel.snp.right).offset(self.view.frame.width/125)
        }
        
        mainButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(deviceInfoView.snp.bottom).offset(self.view.frame.height/16.92)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(19.80)
        }
    }
    
    private func deviceViewSetting(){
        deviceInfoView.addSubview(deviceInfoView.backView)
        deviceInfoView.addSubview(deviceInfoView.name)
        deviceInfoView.addSubview(deviceInfoView.deviceImage)
        
        deviceInfoView.deviceViewSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct DeviceLinkageViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        DeviceLinkageViewController()
    }
}
@available(iOS 13.0, *)
struct DeviceLinkageViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            DeviceLinkageViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

