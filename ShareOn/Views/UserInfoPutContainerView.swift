//
//  UserInfoPutContainerView.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/10.
//

import UIKit
import SnapKit
import Then

class UserInfoPutContainerView: UIView {
    lazy var tfTitle = UILabel().then {
        $0.text = "ID"
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .rgb(red: 255, green: 177, blue: 197)
    }
    lazy var tf = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요."
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
        $0.setPlaceholderColor(.rgb(red: 132, green: 132, blue: 132))
    }
    lazy var divView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 177, blue: 197)
    }
    
    
    func tfSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        
        tfTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        tf.snp.makeConstraints { make in
            make.top.equalTo(tfTitle.snp.bottom).offset(screenHeight/81.2)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.5)
            make.height.equalTo(screenHeight/58)
        }
        
        divView.snp.makeConstraints { make in
            make.top.equalTo(tf.snp.bottom).offset(screenHeight/116)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.45)
            make.height.equalTo(screenHeight/812)
        }
    }
}
