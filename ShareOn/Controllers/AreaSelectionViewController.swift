//
//  AreaSelectionViewController.swift
//  ShareOn
//
//  Created by 노연주 on 2021/10/10.
//

import UIKit
import SnapKit
import Then

class AreaSelectionViewController: UIViewController {
    //MARK: - Properties
    
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
        
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        
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

