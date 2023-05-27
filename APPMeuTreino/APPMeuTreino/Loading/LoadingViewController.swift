//
//  LoadingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 24/05/23.
//

import UIKit
import Lottie

class LoadingViewController: UIViewController {
    
    var loadingAnimationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAnimationView()
    }
    
    private func configureAnimationView() {
        let loadingAnimationView = LottieAnimationView(name: "loading")
        loadingAnimationView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingAnimationView.backgroundColor = .clear
        loadingAnimationView.contentMode = .scaleAspectFit
        loadingAnimationView.center = view.center
        loadingAnimationView.loopMode = .loop
        loadingAnimationView.animationSpeed = 1.0
        loadingAnimationView.play()
        
        view.addSubview(loadingAnimationView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}
