//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Pedaço auto contido de códigos e funcionalidade que podem ser repassados e utilizados em seu codigo
//
//func nomeDoMetodo() -> String {
//    return "Nome do Metodo"
//}
//
//var closureSemParametrosSemRetorno = {
//    print("closureSemParametros")
//}
//
//var closureSemParametrosComRetorno = { () -> Int in
//    return 1
//}
//
//var closureComParametrosComRetorno = { (x: Int) -> Int in
//    return x * 10
//}
//
//closureSemParametrosSemRetorno()
//print(closureSemParametrosComRetorno())
//print(closureComParametrosComRetorno(10))


func soma(_ a:Int, _ b: Int) -> Int{
    return a+b
}

func subtrair(_ a:Int, _ b: Int) -> Int {
    return a-b
}

func calcular(_ a:Int, _ b: Int, _ operador: (Int, Int) -> Int) -> Int {
    return operador(a, b)
}

calcular(10, 20, subtrair)

print(calcular(10, 20, {(_ a:Int, _ b: Int)->Int in return a*b}))
print(calcular(10, 20, {(a,b)->Int in return a+b}))
print(calcular(10, 20, {a,b in return a+b}))
print(calcular(10, 20, {return $0-$1}))
print(calcular(10, 20, {$1/$0}))
print(calcular(10, 20, /))
print(calcular(10, 20, +))

var numeros = [1, 3, 2, 5, 9, 6]

numeros.sort(by: >)

var nomes = ["  Teste1  ", "  Teste2  ", "  Teste3  "]
let nomeSemEspaco = nomes.map({$0.trimmingCharacters(in: CharacterSet.whitespaces)})
print(nomeSemEspaco)
let nomeUpperCase = nomeSemEspaco.map({$0.uppercased()})
print(nomeUpperCase)
let nomeConcat = nomeUpperCase.map({$0 + " CONCAT"})
print(nomeConcat)
