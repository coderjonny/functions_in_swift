//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//
enum myOptional<T> {
    case Some(T)
    case None
}

// Functors

func plusThree(addend: Int) -> Int {
    return addend + 3
}

Optional.Some(3).map(plusThree)

Optional.Some(2)
    .map{ $0 + 3 }
    .map{ $0 + 100}