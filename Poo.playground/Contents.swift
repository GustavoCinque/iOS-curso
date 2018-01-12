//: Playground - noun: a place where people can play

import UIKit

class Pessoa {

    var nome:String?
    var genero:String?
    
    init(nome:String, genero:String) {
        self.nome = nome
        self.genero = genero
    }
    
    func toString(_ append:String = "Pessoa:") {
        var toString = "[nome:" + self.nome! + ", genero:" + self.genero! + "]"
        print(append+toString)
    }
}

let pessoa = Pessoa(nome: "Nome", genero: "Genero")
pessoa.toString()

protocol NomeProtocol {
}