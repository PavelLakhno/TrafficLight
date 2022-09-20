//
//  ViewController.swift
//  TrafficLight
//
//  Created by Павел Лахно on 16.09.2022.
//

import UIKit

private enum LightControl {
    case red, yellow, green
}

class ViewController: UIViewController {
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var lightButton: UIButton!
    
    private var currentControl = LightControl.red
    private let lightOff: CGFloat = 0.1
    private let lightOn: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSettingView(redLightView)
        setupSettingView(yellowLightView)
        setupSettingView(greenLightView)
        
        lightButton.setTitle("START", for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
//        setupSettingView(redLightView)
//        setupSettingView(yellowLightView)
//        setupSettingView(greenLightView)
    }
    @IBAction func changeLightButton() {
        
        if lightButton.currentTitle == "START" {
            lightButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentControl {
        case .red:
            greenLightView.alpha = lightOff
            redLightView.alpha = lightOn
            currentControl = .yellow
        case .yellow:
            redLightView.alpha = lightOff
            yellowLightView.alpha = lightOn
            currentControl = .green
        case .green:
            yellowLightView.alpha = lightOff
            greenLightView.alpha = lightOn
            currentControl = .red
            
        }
    }
    private func setupSettingView (_ view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
        view.alpha = lightOff
    }
    
}

