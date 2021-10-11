//
//  AreaSelectionViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/10.
//

import UIKit
import SnapKit
import Then
import DropDown

class AreaSelectionViewController: UIViewController {
    //MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.text = "Area Selection"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
        $0.textColor = .rgb(red: 159, green: 196, blue: 231)
    }
    
    private let firstDropDownButton = UIButton().then {
        $0.layer.borderColor = UIColor.rgb(red: 96, green: 155, blue: 210).cgColor
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(showBigDropDown), for: .touchUpInside)
    }
    
    private let firstAreaLabel = UILabel().then {
        $0.text = "시 / 도 선택"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    private let firstDownButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-bigDown"), for: .normal)
        $0.addTarget(self, action: #selector(showBigDropDown), for: .touchUpInside)
    }

    lazy var firstDropDown = DropDown().then {
        $0.dataSource = ["서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "경기도", "강원도", "경상북도", "경상남도", "충청북도", "충청남도", "전라북도", "전라남도", "제주특별자치도"]
        $0.textFont = UIFont(name: "AppleSDGothicNeo-Thin", size: 16)!
        $0.direction = .bottom
        $0.anchorView = firstDropDownButton
        $0.bottomOffset = CGPoint(x: 0, y: self.view.frame.height/20.82)
        $0.backgroundColor = UIColor.rgb(red: 211, green: 229, blue: 246)
        $0.cornerRadius = 10
        $0.cellHeight = self.view.frame.height/25.375
        $0.shadowColor = UIColor.lightGray
        $0.shadowOffset = CGSize(width: 0, height: 3)
        $0.shadowRadius = 10
        $0.shadowOpacity = 0.3
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
        $0.selectedTextColor = .rgb(red: 0, green: 0, blue: 0)
        $0.selectionBackgroundColor = .rgb(red: 255, green: 255, blue: 255)
        $0.width = self.view.frame.width/1.31
        $0.selectionAction = { [unowned self] (index: Int, item: String) in
            firstAreaLabel.text = item
            smallDataSetting()
        }
    }
    
    lazy var secondDropDownButton = UIButton().then {
        $0.backgroundColor = .rgb(red: 159, green: 196, blue: 231)
        $0.addTarget(self, action: #selector(showSmallDropDown), for: .touchUpInside)
    }
    
    lazy var secondAreaLabel = UILabel().then {
        $0.text = "세부 지역 선택"
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-UltraLight")
        $0.textColor = .rgb(red: 255, green: 255, blue: 255)
    }
    
    lazy var secondDownButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-smallDown"), for: .normal)
        $0.addTarget(self, action: #selector(showSmallDropDown), for: .touchUpInside)
    }
    
    lazy var secondDropDown = DropDown().then {
        $0.dataSource = []
        $0.textFont = UIFont(name: "AppleSDGothicNeo-Thin", size: 16)!
        $0.direction = .bottom
        $0.anchorView = secondDropDownButton
        $0.bottomOffset = CGPoint(x: 0, y: self.view.frame.height/20.82)
        $0.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255)
        $0.cornerRadius = 10
        $0.cellHeight = self.view.frame.height/25.375
        $0.shadowColor = UIColor.lightGray
        $0.shadowOffset = CGSize(width: 0, height: 3)
        $0.shadowRadius = 10
        $0.shadowOpacity = 0.3
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
        $0.selectedTextColor = .rgb(red: 0, green: 0, blue: 0)
        $0.selectionBackgroundColor = .rgb(red: 211, green: 229, blue: 246)
        $0.width = self.view.frame.width/2.55
        $0.selectionAction = { [unowned self] (index: Int, item: String) in
            secondAreaLabel.text = item
        }
    }
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    private func showBigDropDown(_ sender : UIButton) {
        firstDropDown.show()
    }
    
    @objc
    private func showSmallDropDown(_ sender : UIButton) {
        secondDropDown.show()
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    private func smallDataSetting(){
        if firstAreaLabel.text == "서울특별시" {
            secondDropDown.dataSource = ["종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"]
        } else if firstAreaLabel.text == "부산광역시" {
            secondDropDown.dataSource = ["중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "강서구", "해운대구", "사하구", "금정구", "연제구", "수영구", "사상구", "기장군"]
        } else if firstAreaLabel.text == "대구광역시" {
            secondDropDown.dataSource = ["중구", "동구", "서구", "남구", "북구", "수성구", "달성구", "달성군"]
        } else if firstAreaLabel.text == "인천광역시" {
            secondDropDown.dataSource = ["중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"]
        } else if firstAreaLabel.text == "광주광역시" {
            secondDropDown.dataSource = ["광산구", "동구", "서구", "남구", "북구"]
        } else if firstAreaLabel.text == "대전광역시" {
            secondDropDown.dataSource = ["동구", "중구", "서구", "유성구", "대덕구"]
        } else if firstAreaLabel.text == "울산광역시" {
            secondDropDown.dataSource = ["중구", "남구", "동구", "북구", "울주군"]
        }
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(titleLabel)
        view.addSubview(firstDropDownButton)
        view.addSubview(firstAreaLabel)
        view.addSubview(firstDownButton)
        view.addSubview(secondDropDownButton)
        view.addSubview(secondAreaLabel)
        view.addSubview(secondDownButton)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        firstDropDownButton.layer.borderWidth = self.view.frame.width/375
        firstDropDownButton.layer.cornerRadius = self.view.frame.width/37.5
        secondDropDownButton.layer.cornerRadius = self.view.frame.width/37.5
    }
    
    // MARK: - Location
    
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.07)
            make.left.equalToSuperview().offset(self.view.frame.width/6.25)
        }
        
        firstDropDownButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/10.68)
            make.width.equalToSuperview().dividedBy(1.31)
            make.height.equalToSuperview().dividedBy(20.82)
        }
        
        firstAreaLabel.snp.makeConstraints { make in
            make.centerY.equalTo(firstDropDownButton)
            make.left.equalTo(firstDropDownButton).offset(self.view.frame.width/25)
        }
        
        firstDownButton.snp.makeConstraints { make in
            make.centerY.equalTo(firstDropDownButton)
            make.right.equalTo(firstDropDownButton).inset(self.view.frame.width/19.74)
            make.width.equalToSuperview().dividedBy(31.25)
            make.height.equalToSuperview().dividedBy(162.4)
        }
        
        secondDropDownButton.snp.makeConstraints { make in
            make.left.equalTo(firstDropDownButton)
            make.top.equalTo(firstDropDownButton.snp.bottom).offset(self.view.frame.height/58)
            make.width.equalToSuperview().dividedBy(2.55)
            make.height.equalToSuperview().dividedBy(20.82)
        }
        
        secondAreaLabel.snp.makeConstraints { make in
            make.left.equalTo(secondDropDownButton).offset(self.view.frame.width/25)
            make.centerY.equalTo(secondDropDownButton)
        }
        
        secondDownButton.snp.makeConstraints { make in
            make.centerY.equalTo(secondDropDownButton)
            make.right.equalTo(secondDropDownButton).inset(self.view.frame.width/19.74)
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(111.23)
        }

    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct AreaSelectionViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        AreaSelectionViewController()
    }
}
@available(iOS 13.0, *)
struct AreaSelectionViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            AreaSelectionViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

