//
//  main.swift
//  homeWork_lesson_2
//
//  Created by user155176 on 6/21/19.
//  Copyright © 2019 user155176. All rights reserved.
//

import Foundation;
//Task1. Написать функцию, которая определяет, четное число или нет.-----------------------------------------
func findEvenNumber(number: Int) -> () {
    if(number%2 == 0 && number != 0){
        return print("The number is even")
    } else {
        return print("The number is odd")
    }
}
print("enter the number please")
let number = Int(readLine()!);
if let number = number {
    findEvenNumber(number: number)
}

//Task 2.Написать функцию, которая определяет, делится ли число без остатка на3.----------------
func deleteOnThree(number2: Int) -> () {
    if((number2%3) == 0){
        return print("TRUE")
    } else {
        return print("FALSE")
    }
}
print("enter the number to check if it may be divisioned on 3")
let number2 = Int(readLine()!);
if let number2 = number2 {
    deleteOnThree(number2: number2)
}
//Task3.. Создать возрастающий массив из 100 чисел.--------------------------------------
var array = [Int](1...100)
print(array);

//Task 4.4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
array.removeAll( where: {$0 % 2 == 0 || $0%3 != 0 })
print(array);












