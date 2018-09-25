//
//  Question.swift
//  learning
//
//  Created by James Hunt on 8/12/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

import Firebase
struct QuestionObject {
    
    var question = String()
    var a = String()
    var b = String()
    var c = String()
    var d = String()
    var answer = String()
    var questionNum = String()

    var dictionary: [String: Any] {
        return ["question": question,
                "a": a,
                "b": b,
                "c": c,
                "d": d,
                "theanswer": answer,
                "questionNum": questionNum
        ]
    }
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }

    


}


