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

//Task 5  . * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
var massive = [Int]();

func fib (_ n: Int) -> () {
    var n1: Int = 0
    var n2: Int = 0
    var sum:Int  = 1
    
    if n == 0 {
        massive.append(n)
        
    } else if n == 1{
        massive.append(n)
        } else {
        massive+=[0,1]
        
        for a in 1..<n-1 {
            n1 = n2
            n2 = sum
            sum = n1 + n2
            massive.append(sum)
        }
    
      }
    
}
print(fib(93));           //ne poluchaetsya dobavit 100, posle 94 chisla slishkom bolshie chtobi peremennaya mogla hranit' ih, data tape toje ne pomog, podjkajite, kak mojno sdelat'?
print(massive);








