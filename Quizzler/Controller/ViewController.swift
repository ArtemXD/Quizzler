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
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonThree: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFirstQuestion()
        buttonTwo.layer.cornerRadius = 27
        buttonOne.layer.cornerRadius = 27
        buttonThree.layer.cornerRadius = 27
    }
    
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        if quizBrain.checkLastQuestion() {
            setFirstQuestion()
        } else {
            checkAnswer2(sender)
            if !quizBrain.qNumCheck() {
                questionLabel.text = quizBrain.quizText()
                let varAnswer = quizBrain.answerText()
                buttonOne.setTitle(varAnswer[0], for: .normal)
                buttonTwo.setTitle(varAnswer[1], for: .normal)
                buttonThree.setTitle(varAnswer[2], for: .normal)
                scoreLabel.text = String(quizBrain.trueAnswer)
            } else {
                if quizBrain.trueAnswer > 5 {
                    questionLabel.text = "Good"
                    buttonOne.setTitle(":)", for: .normal)
                    buttonTwo.setTitle(":)", for: .normal)
                    buttonThree.setTitle(":)", for: .normal)
                } else {
                    questionLabel.text = "Bad"
                    buttonOne.setTitle(":(", for: .normal)
                    buttonTwo.setTitle(":(", for: .normal)
                    buttonThree.setTitle(":(", for: .normal)
                }
                scoreLabel.text = String(quizBrain.trueAnswer)
                quizBrain.trueAnswer = 0
            }
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
        buttonTwo.backgroundColor = .clear
        buttonOne.backgroundColor = .clear
        buttonThree.backgroundColor = .clear
    }
    
    func setFirstQuestion(){
        questionLabel.text = quizBrain.quizText()
        let varAnswer = quizBrain.answerText()
        buttonOne.setTitle(varAnswer[0], for: .normal)
        buttonTwo.setTitle(varAnswer[1], for: .normal)
        buttonThree.setTitle(varAnswer[2], for: .normal)
        scoreLabel.text = String(quizBrain.trueAnswer)
    }

}

