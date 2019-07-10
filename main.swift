//
//  main.swift
//  11
//
//  Created by user155176 on 10/07/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу. */

import Foundation

protocol Container {
    //associatedtype Item: Equatable
    var count: Int { get }
  
}


struct Queue<T>{
    
    var items = [T]()
   // var count: Int {
      //  return items.count
   // }
    
    
    
    mutating func push(_ item: T){
        items.append(item)
    }
    mutating func remove () -> T?{
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
    mutating func pick() -> T{
        return items.last!
    }
    mutating func pushAtFirst(_ item: T){
        items.insert(item, at: 0)
    }
    
    // при попытках написания функций высшего порядка, постоянно получались проблемы, что он то не видел,что такое , то еще что-то, пробовал отдельно их описать в протоколе, но тогда другие ошибки выскакивали( поэтому оставил просто такой способ с ошибкой
    mutating func test() -> (T){
        return items.filter({ (value) -> Bool in
            return value.count < 5
        })
    }
    

}
extension Queue {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
        
    }
}

var test = ["one","two"]


var stack = Queue<String>()
stack.push("Hi")
print(stack.items)
stack.push("drug")
stack.push("dog")
print(stack.pick())
print(stack)
//print(stack.test())

if let topItem = stack.topItem {
    print("The top item on the stack is \(topItem).")
}
