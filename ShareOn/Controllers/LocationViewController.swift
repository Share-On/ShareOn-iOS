//
//  LocationViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/11/08.
//

import UIKit
import SnapKit
import Then

class LocationViewController: UIViewController {
    //MARK: - Properties
    
    private let backImage = UIImageView().then {
        $0.image = UIImage(named: "ShareOn-LocationBack")
        $0.contentMode = .scaleAspectFill
    }
    
    private let homeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-HomeButton"), for: .normal)
    }
    
    private let minusButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-MinusButton"), for: .normal)
    }
    
    private let plusButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ShareOn-PlusButton"), for: .normal)
    }
    
    private let allEnergy = UILabel().then {
        $0.text = "1230kwh"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(backImage)
        view.addSubview(homeButton)
        view.addSubview(minusButton)
        view.addSubview(plusButton)
        view.addSubview(allEnergy)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        backImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        homeButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(12.5)
            make.height.equalToSuperview().dividedBy(25.38)
            make.right.equalToSuperview().offset(-self.view.frame.width/22.06)
            make.top.equalToSuperview().offset(self.view.frame.height/14.76)
        }
        
        minusButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(4.38)
            make.height.equalToSuperview().dividedBy(10.34)
            make.top.equalToSuperview().offset(self.view.frame.height/5.01)
            make.right.equalToSuperview().offset(-self.view.frame.width/3.97)
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(minusButton)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/8.59)
            make.right.equalTo(-self.view.frame.width/3.11)
        }
        
        allEnergy.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LocationViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LocationViewController()
    }
}
@available(iOS 13.0, *)
struct LocationViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LocationViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

