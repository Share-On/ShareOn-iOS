//
//  HistoryTableViewCell.swift
//  ShareOn
//
//  Created by 노연주 on 2021/11/19.
//

import UIKit
import SnapKit
import Then

class HistoryTableViewCell: UITableViewCell {
    
    static let HistoryTableViewCellIdentifier = "\(HistoryTableViewCell.self)"

    let plusOrMinus = UILabel().then {
        $0.text = "+"
        $0.dynamicFont(fontSize: 38, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .plusColor
    }
    
    let dateLabel = UILabel().then {
        $0.text = "2021년 9월 29일"
        $0.textColor = .rgba(red: 0, green: 0, blue: 0, alpha: 0.24)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    let locationLabel = UILabel().then {
        $0.text = "광주광역시 광산구"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    let energyLabel = UILabel().then {
        $0.text = "230kwh"
        $0.textColor = .plusEnergyColor
        $0.dynamicFont(fontSize: 16, currentFontName: "AlfaSlabOne-Regular")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 7, left: 0, bottom: 0, right: 0))
    }

    func configureUI(){
        
        layer.shadowColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1.5
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.position = contentView.center
        layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        let bounds = contentView.bounds
        contentView.addSubview(plusOrMinus)
        contentView.addSubview(dateLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(energyLabel)

        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.29)
        }
        
        plusOrMinus.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(bounds.width/12.61)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(plusOrMinus.snp.right).offset(bounds.width/22.31)
            make.top.equalToSuperview().offset(bounds.height/5)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(dateLabel)
            make.top.equalTo(dateLabel.snp.bottom)
        }
        
        energyLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(locationLabel.snp.right).offset(bounds.width/14.42)
        }
    }
}
