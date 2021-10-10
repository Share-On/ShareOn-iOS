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
    
    private let bigDropDownButton = UIButton().then {
        $0.layer.borderColor = UIColor.rgb(red: 96, green: 155, blue: 210).cgColor
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(showBigDropDown), for: .touchUpInside)
    }
    
    private let bigAreaLabel = UILabel().then {
        $0.text = "시 / 도 선택"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    private let bigDownButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-bigDown"), for: .normal)
        $0.addTarget(self, action: #selector(showBigDropDown), for: .touchUpInside)
    }

    lazy var bigDropDown = DropDown().then {
        $0.dataSource = ["서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "경기도", "강원도", "경상북도", "경상남도", "충청북도", "충청남도", "전라북도", "전라남도", "제주특별자치도"]
        $0.textFont = UIFont(name: "AppleSDGothicNeo-Thin", size: 16)!
        $0.direction = .bottom
        $0.anchorView = bigDropDownButton
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
            bigAreaLabel.text = item
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
        bigDropDown.show()
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(titleLabel)
        view.addSubview(bigDropDownButton)
        view.addSubview(bigAreaLabel)
        view.addSubview(bigDownButton)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        bigDropDownButton.layer.borderWidth = self.view.frame.width/375
        bigDropDownButton.layer.cornerRadius = self.view.frame.width/37.5
    }
    
    // MARK: - Location
    
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.07)
            make.left.equalToSuperview().offset(self.view.frame.width/6.25)
        }
        
        bigDropDownButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/10.68)
            make.width.equalToSuperview().dividedBy(1.31)
            make.height.equalToSuperview().dividedBy(20.82)
        }
        
        bigAreaLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bigDropDownButton)
            make.left.equalTo(bigDropDownButton).offset(self.view.frame.width/25)
        }
        
        bigDownButton.snp.makeConstraints { make in
            make.centerY.equalTo(bigDropDownButton)
            make.right.equalTo(bigDropDownButton).inset(self.view.frame.width/19.74)
            make.width.equalToSuperview().dividedBy(31.25)
            make.height.equalToSuperview().dividedBy(162.4)
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

