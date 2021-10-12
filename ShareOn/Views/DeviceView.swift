//
//  DeviceView.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/11.
//

import UIKit
import SnapKit
import Then

class DeviceView: UIView {
    lazy var backView = UIView()
    
    lazy var name = UILabel().then {
        $0.text = "device Name"
        $0.dynamicFont(fontSize: 24, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .rgb(red: 112, green: 112, blue: 112)
    }
    
    lazy var deviceImage = UIView().then {
        $0.backgroundColor = .rgb(red: 211, green: 229, blue: 246)
        $0.layer.borderColor = UIColor.rgb(red: 159, green: 195, blue: 230).cgColor
        $0.layer.borderWidth = 4
    }
    
    func deviceViewSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        name.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(backView).offset(screenHeight/16.24)
        }
        
        deviceImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(name.snp.bottom).offset(screenHeight/26.19)
            make.width.equalToSuperview().dividedBy(2.21)
            make.height.equalTo(deviceImage.snp.width)
        }
    }
}
