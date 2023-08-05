//
//  ViewController.swift
//  Quizzler
//
//  Created by Danila Okuneu on 2.08.23.
//

import UIKit

class ViewController: UIViewController {
    
    //    Interface Builder Outlets
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var questBrain = QuestBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerbuttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel!.text!
        if questBrain.checkAnswer(userAnswer) {
            sender.tintColor = UIColor.systemGreen
        } else {
            sender.tintColor = UIColor.systemRed
        }
        questBrain.updateQuestionNumber()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        scoreLabel.text = questBrain.getScore()
        questionLabel.text = questBrain.getQuestionText()
        trueButton.tintColor = UIColor.systemBlue
        falseButton.tintColor = UIColor.systemBlue
        progressBar.progress = questBrain.getProgress()
    }
    
}

