//
//  MonthOfEnergyAlterView.swift.swift
//  ShareOn
//
//  Created by 노연주 on 2021/11/11.
//

import UIKit
import SnapKit
import Then

class MonthOfEnergyAlterView: UIView {
    
    lazy var monthLabel = UILabel().then {
        $0.text = "이번 달 사용 가능 전력량입니다."
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .rgb(red: 110, green: 109, blue: 126)
    }
    
    lazy var energyGraph = UIImageView().then {
        $0.image = UIImage(named: "ShareOn-AlterGraph")
    }
    
    lazy var energyLabel = UILabel().then {
        $0.text = "230kwh"
        $0.textColor = .rgb(red: 113, green: 218, blue: 103)
        $0.dynamicFont(fontSize: 25, currentFontName: "AlfaSlabOne-Regular")
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
        monthLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(sh/23.2)
            make.left.equalToSuperview().offset(sw/3.57)
            make.width.equalTo(sw/1.88)
            make.height.equalTo(sh/40.6)
        }
        
        energyGraph.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(sw/12.5)
            make.width.equalTo(sw/6.25)
            make.height.equalTo(sh/13.53)
        }
        
        energyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(monthLabel)
            make.top.equalTo(monthLabel.snp.bottom).offset(sh/270.67)
            make.width.equalTo(sw/3.13)
            make.height.equalTo(sh/21.95)
        }
        
        cancleButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(sh/45.11)
            make.left.equalToSuperview().offset(sw/2.82)
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
