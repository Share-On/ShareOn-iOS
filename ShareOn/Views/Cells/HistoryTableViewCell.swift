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

    func configureUI(){
        
    }
}
