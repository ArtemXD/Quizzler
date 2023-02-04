//
//  Question.swift
//  Quizzler
//
//  Created by Артём Голынец on 3.02.23.
//

import Foundation


struct Question {
    let questionText : String
    let answer : [String]
    let correctAnswer : String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.questionText = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
