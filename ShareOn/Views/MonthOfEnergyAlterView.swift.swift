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
    }
    
    lazy var okButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.rgb(red: 223, green: 24, blue: 77), for: .normal)
        $0.backgroundColor = .rgb(red: 246, green: 223, blue: 229)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    let bound: CGRect = UIScreen.main.bounds
        
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        layoutSetting()
    }
    
    func layoutSetting(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.3
        self.backgroundColor = .white
            
        self.addSubview(monthLabel)
        self.addSubview(energyGraph)
        self.addSubview(energyLabel)
        self.addSubview(cancleButton)
        self.addSubview(okButton)
    }

}
