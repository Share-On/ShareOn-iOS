//
//  PlusEnergyAlterView.swift
//  ShareOn
//
//  Created by 노연주 on 2021/11/20.
//

import UIKit
import SnapKit
import Then

class PlusEnergyAlterView: UIView {
    lazy var energyTf = UITextField().then {
        $0.backgroundColor = .rgb(red: 246, green: 223, blue: 229)
        $0.layer.cornerRadius = 15
        $0.dynamicFont(fontSize: 20, currentFontName: "AlfaSlabOne-Regular")
        $0.textColor = .rgb(red: 227, green: 75, blue: 115)
        $0.addLeftPadding()
    }
    
    lazy var cancleButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.backgroundColor = .rgb(red: 223, green: 223, blue: 223)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
        $0.layer.cornerRadius = 10
        $0.setTitleColor(.black, for: .normal)
    }
    
    lazy var okButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.rgb(red: 223, green: 24, blue: 77), for: .normal)
        $0.backgroundColor = .rgb(red: 246, green: 223, blue: 229)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
        $0.layer.cornerRadius = 10
    }
    
    func layoutSetting(sw: CGFloat, sh: CGFloat){
        energyTf.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(sh/38.67)
            make.width.equalTo(sw/1.41)
            make.height.equalTo(sh/14.25)
        }
        
        cancleButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(sh/45.11)
            make.left.equalToSuperview().offset(sw/2.68)
            make.width.equalTo(sw/5.36)
            make.height.equalTo(sh/29)
        }
        
        okButton.snp.makeConstraints { make in
            make.top.equalTo(cancleButton)
            make.left.equalTo(cancleButton.snp.right).offset(23.44)
            make.width.height.equalTo(cancleButton)
        }
    }
}
