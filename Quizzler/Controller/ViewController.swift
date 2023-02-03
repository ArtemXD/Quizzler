//
//  ViewController.swift
//  Quizzler
//
//  Created by Артём Голынец on 2.02.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizBrain.quiz[0].questionText
        trueButton.layer.cornerRadius = 27
        falseButton.layer.cornerRadius = 27
    }
    
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        if quizBrain.checkLastQuestion() {
            return
        }
        checkAnswer2(sender)
        if !quizBrain.qNumCheck() {
            questionLabel.text = quizBrain.quizText()
            scoreLabel.text = String(quizBrain.trueAnswer)
        }
    }
    
    
    func checkAnswer2(_ sender: UIButton) {

        let answer = quizBrain.checkAnswer(sender.titleLabel?.text ?? "")
        
        if answer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearButtonBack), userInfo: nil, repeats: false)
        progressBar.progress = quizBrain.quizProgress()
    }
    
    @objc func clearButtonBack() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }

}

