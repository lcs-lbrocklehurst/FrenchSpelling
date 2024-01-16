//
//  WordView.swift
//  FrenchSpelling
//
//  Created by Lewis Brocklehurst on 2024-01-15.
//

import Foundation

struct Word: Identifiable {
    let id = UUID()
    let english: String
    let french: String
}

let vocabularyList: [Word] = [

Word(english: "potato", french: "pomme de terre"),
Word(english: "banana", french: "banane"),
Word(english: "apple", french: "banane"),
Word(english: "computer", french: "ordinateur"),
Word(english: "girl", french: "fille"),
Word(english: "boy", french: "garcon"),
Word(english: "tomato", french: "tomate"),
Word(english: "pineapple", french: "ananas"),
Word(english: "grapes", french: "raisin"),
Word(english: "eggs", french: "oeufs"),
Word(english: "cucumber", french: "concombre"),
Word(english: "cherry", french: "cerise"),
Word(english: "watermelon", french: "melon d'eau"),
Word(english: "strawberry", french: "fraise"),
Word(english: "pear", french: "poire"),
Word(english: "lemon", french: "citron"),
Word(english: "corn", french: "mais"),
Word(english: "celery", french: "celeri"),
Word(english: "grapefruit", french: "pamplemousse")

]


