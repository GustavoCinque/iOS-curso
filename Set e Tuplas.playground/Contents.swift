//: Playground - noun: a place where people can play

import UIKit

//let set = Set<Int>([10,20])
//set = [1.0, 1.2, 1.1]

var setNum = Set<Int>(1...5)
var resultadoUm = setNum.insert(1)
var resultado = setNum.insert(6)

print(resultado.inserted)
print(resultadoUm.inserted)

var setNum2 = Set<Int>(6...9)
var novoSet = setNum.union(setNum2)
var outroSet = setNum.intersection(setNum2)
var aindaOutroSet = setNum.subtracting(setNum2)


//Tuplas
let endereco = "Teste 1, Teste2, Teste3"

let enderecoDois = ("Teste1", "Teste2", "Teste3", "Teste4")

let enderecoTres:(tipo:String, nome:String, numero:Int) = ("tipo", "nomeTeste", 10)

print(enderecoTres.tipo)

let(tipo, _, numero) = enderecoTres

print(tipo)
pritn(numero)