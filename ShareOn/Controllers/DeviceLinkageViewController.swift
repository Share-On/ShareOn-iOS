//
//  DeviceLinkageViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/11.
//

import UIKit
import SnapKit
import Then

class DeviceLinkageViewController: UIViewController {
    //MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.text = "Device linkage"
        $0.dynamicFont(fontSize: 30, currentFontName: "AlfaSlabOne-Regular")
        $0.textColor = .rgb(red: 159, green: 196, blue: 231)
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
        view.addSubview(titleLabel)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.07)
            make.left.equalToSuperview().offset(self.view.frame.width/6.25)
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct DeviceLinkageViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        DeviceLinkageViewController()
    }
}
@available(iOS 13.0, *)
struct DeviceLinkageViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            DeviceLinkageViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

