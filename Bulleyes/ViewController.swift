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
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
    }

    @IBAction func showAlert()
    {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        
        if difference == 0
        {
            title = "Perfect! You get 100 points bonus"
            points += 100
        }
        else if difference == 1
        {
            title = "You almost had it!, 50 points bonus"
            points += 50
        }
        else
        {
            title = "Not even close!"
        }
        
        score += points
        
        let message = "You score \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

    @IBAction func sliderMoved(_ slider: UISlider)
    {
        print("The value of the slider is now: \(slider.value)")
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startOver()
    {
        round = 0
        score = 0
        startNewRound()
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

