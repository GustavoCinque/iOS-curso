////: Playground - noun: a place where people can play
//
//import UIKit
//
//let str = "Hello, playground"
//
//var array = ["item1", "item2", "item3"]
// array[1..<3] = ["item2.1", "item2.2"]
//
//print(array)
//
//array.removeFirst()
//array.remove(at: 1)
//
//print(array)
//
//var dicionario : [String: Int] = ["Teste1":1, "Teste2":2]
//
//dicionario["Teste2"]=3
//
//print(dicionario)
//
//for (chave, valor) in dicionario {
//    print(chave)
//    print(valor)
//}
//
//var cardValue = "Teste"
//
//switch cardValue {
//case "Test":
//    print("Wue")
//default:
//    break
//}
//
//var cardValueInt = 12
//
//switch cardValueInt {
//case 1...10:
//    break
//case 11, 12, 13, 14:
//    break
//default:
//    break
//}
//
//var complete = true;
//while !complete {
//
//}
//
//var completeRepeat = true;
//repeat{
//    
//}while !completeRepeat
//
//var carros = ["Carro1", "Carro2", "Carro3", "Carro4", "Carro5"]
//
//for index in (0..<carros.count) {
//    print(("O indice do carro \(carros[index]) é \(index)"))
//}
//
//for carro in carros {
//    print(carro)
//}

func funcaoSemParametro() {
    print("funcaoSemParametro")
}

funcaoSemParametro()

func funcaoComParametro(param:String) {
    print(param)
}

funcaoComParametro(param: "funcaoComParametro")

func funcaoComParametroSemDizerNomeDeParametro(_ param: String) {
    print(param)
}

funcaoComParametroSemDizerNomeDeParametro("funcaoComParametroSemDizerNomeDeParametro")

func funcaoComMaisDeUmParametro(_ nome: String, _ sobreNome: String) {
    print(nome); print(sobreNome)
}

funcaoComMaisDeUmParametro("Nome", "Sobrenome")

