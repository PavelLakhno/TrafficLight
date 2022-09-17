//
//  ViewController.swift
//  TrafficLight
//
//  Created by Павел Лахно on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var lightButton: UIButton!
    
    let alphaView: CGFloat = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSettingView(redLightView)
        setupSettingView(yellowLightView)
        setupSettingView(greenLightView)
        
        lightButton.configuration = setupButton(with: "START")
    }

    @IBAction func changeLightButton() {
        lightButton.configuration = setupButton(with: "NEXT")
        
        if redLightView.alpha == yellowLightView.alpha {
            redLightView.alpha = 1
            greenLightView.alpha = alphaView
        } else if yellowLightView.alpha == greenLightView.alpha && redLightView.alpha == 1 {
            yellowLightView.alpha = 1
            redLightView.alpha = alphaView
        } else {
            redLightView.alpha = alphaView
            yellowLightView.alpha = alphaView
            greenLightView.alpha = 1
        }
    }
    
    private func setupSettingView (_ view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
        view.alpha = alphaView
    }
    
    private func setupButton (with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = title
        buttonConfiguration.cornerStyle = .large
        return buttonConfiguration
    }
    
}

