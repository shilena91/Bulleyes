//
//  ViewController.swift
//  Bulleyes
//
//  Created by Hoang Pham on 1/24/20.
//  Copyright © 2020 Hoang Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        
        startNewRound()
    }

    @IBAction func showAlert()
    {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You score \(points) points"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }

    @IBAction func sliderMoved(_ slider: UISlider)
    {
        print("The value of the slider is now: \(slider.value)")
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound()
    {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabel()
    }
    
    func updateLabel()
    {
        label.text = "\(targetValue)"
        labelScore.text = String(score)
        roundLabel.text = String(round)
    }
    
}
