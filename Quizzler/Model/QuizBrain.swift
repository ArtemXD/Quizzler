//
//  QuixBrain.swift
//  Quizzler
//
//  Created by Артём Голынец on 4.02.23.
//

import Foundation

struct QuizBrain {
    
    let quiz = [ Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                 Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                 Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                 Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                 Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                 Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                 Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                 Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                 Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                 Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]
    
    var qNum = 0
    
    var trueAnswer = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[qNum].correctAnswer {
            trueAnswer += 1
            return true
        } else {
            return false
        }
    }
    
    func quizProgress() -> Float {
        return Float((qNum + 1)) / Float(quiz.count)
    }
    
    func quizText() -> String {
        return quiz[qNum].questionText
    }
    
    func answerText() -> [String] {
        return quiz[qNum].answer
    }
    
    mutating func qNumCheck() -> Bool {
        if(qNum == quiz.count - 1) {
            qNum = -1
            return true
        } else {
            qNum += 1
            return false
        }
    }
    
    mutating func checkLastQuestion() -> Bool {
        if qNum < 0 {
            qNum = 0
            return true
        } else {
            return false
        }
    }
}
