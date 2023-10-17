//
//  ViewController.swift
//  HW23p1
//
//  Created by Вадим Игнатенко on 4.10.23.
//

import UIKit
import Lottie

final class ViewController: UIViewController {
    
    private var viewRed = false
    private let collecionAnim: [String] = ["2", "3", "4", "1"]
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet private weak var coreAnimationView: UIView!
    private var lottieAnimationView: LottieAnimationView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreAnimationView.backgroundColor = .green
        lottieAnimationViewSetup()
    }
    
    @IBAction private func coreAnimAction(_ sender: UIButton) {
        sender.pulsate()
        UIView.transition(with: coreAnimationView,
                          duration: 0.8,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
            guard let self else { return }
            self.coreAnimationView.backgroundColor = self.viewRed ? .green : .red
            self.viewRed.toggle() },
                          completion: nil)
    }
    
    @IBAction private func lottieAction(_ sender: UIButton) {
        sender.pulsate()
        guard let random = collecionAnim.randomElement() else { return }
        lottieAnimationView.animation = .named(random)
        lottieAnimationView.play()
    }
    
    private func lottieAnimationViewSetup() {
        guard let firstElement = collecionAnim.first else { return }
        lottieAnimationView = .init(name: firstElement)
        //lottieAnimationView.animation = .named(firstElement)
        lottieAnimationView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        lottieAnimationView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .playOnce
        lottieAnimationView.animationSpeed = 1
        stackView.addArrangedSubview(lottieAnimationView)
        lottieAnimationView.play()
    }
    
    
}

