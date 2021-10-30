//
//  TabBar.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/12.
//

import UIKit
import SnapKit
import Then

class TabBar: UIView {
    lazy var backgroundImage = UIImageView().then {
        $0.image = UIImage(named: "ShareOn-BlueBack")
    }
    
    lazy var mainButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-BlueMain"), for: .normal)
    }
    
    lazy var locationButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-BlueLocation"), for: .normal)
    }
    
    lazy var historyButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-BlueHistory"), for: .normal)
    }
    
    lazy var settingButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-BlueSetting"), for: .normal)
    }
    
    func blueTabBarSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(screenHeight/67.67)
            make.left.equalTo(backgroundImage).offset(screenWidth/12.5)
            make.width.equalTo(screenWidth/12.10)
            make.height.equalTo(screenHeight/23.88)
        }
        
        locationButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/3.02)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/25.38)
        }
        
        historyButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.63)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/32.48)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.17)
            make.width.equalTo(screenWidth/10.71)
            make.height.equalTo(screenHeight/23.2)
        }
    }
    
    func greenTabBarSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        backgroundImage.image = UIImage(named: "ShareOn-GreenBack")
        mainButton.setBackgroundImage(UIImage(named: "ShareOn-GreenMain"), for: .normal)
        locationButton.setBackgroundImage(UIImage(named: "ShareOn-GreenLocation"), for: .normal)
        historyButton.setBackgroundImage(UIImage(named: "ShareOn-GreenHistory"), for: .normal)
        settingButton.setBackgroundImage(UIImage(named: "ShareOn-GreenSetting"), for: .normal)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(screenHeight/67.67)
            make.left.equalTo(backgroundImage).offset(screenWidth/12.5)
            make.width.equalTo(screenWidth/12.10)
            make.height.equalTo(screenHeight/23.88)
        }
        
        locationButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/3.02)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/25.38)
        }
        
        historyButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.63)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/32.48)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.17)
            make.width.equalTo(screenWidth/10.71)
            make.height.equalTo(screenHeight/23.2)
        }
    }
    
    func yellowTabBarSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        backgroundImage.image = UIImage(named: "ShareOn-YellowBack")
        mainButton.setBackgroundImage(UIImage(named: "ShareOn-YellowMain"), for: .normal)
        locationButton.setBackgroundImage(UIImage(named: "ShareOn-YellowLocation"), for: .normal)
        historyButton.setBackgroundImage(UIImage(named: "ShareOn-YellowHistory"), for: .normal)
        settingButton.setBackgroundImage(UIImage(named: "ShareOn-YellowSetting"), for: .normal)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(screenHeight/67.67)
            make.left.equalTo(backgroundImage).offset(screenWidth/12.5)
            make.width.equalTo(screenWidth/12.10)
            make.height.equalTo(screenHeight/23.88)
        }
        
        locationButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/3.02)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/25.38)
        }
        
        historyButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.63)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/32.48)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.17)
            make.width.equalTo(screenWidth/10.71)
            make.height.equalTo(screenHeight/23.2)
        }
    }
    
    func pinkTabBarSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        backgroundImage.image = UIImage(named: "ShareOn-PinkBack")
        mainButton.setBackgroundImage(UIImage(named: "ShareOn-PinkMain"), for: .normal)
        locationButton.setBackgroundImage(UIImage(named: "ShareOn-PinkLocation"), for: .normal)
        historyButton.setBackgroundImage(UIImage(named: "ShareOn-PinkHistory"), for: .normal)
        settingButton.setBackgroundImage(UIImage(named: "ShareOn-PinkSetting"), for: .normal)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(screenHeight/67.67)
            make.left.equalTo(backgroundImage).offset(screenWidth/12.5)
            make.width.equalTo(screenWidth/12.10)
            make.height.equalTo(screenHeight/23.88)
        }
        
        locationButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/3.02)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/25.38)
        }
        
        historyButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.63)
            make.width.equalTo(screenWidth/15)
            make.height.equalTo(screenHeight/32.48)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(backgroundImage).offset(screenWidth/1.17)
            make.width.equalTo(screenWidth/10.71)
            make.height.equalTo(screenHeight/23.2)
        }
    }
}
