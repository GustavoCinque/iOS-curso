//
//  Pessoa.swift
//  swift-project
//
//  Created by Cast Group on 12/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

import UIKit

class Pessoa: NSObject {

    private var nome:String
    private var idade:Int
    
    init(_ nome:String = "Nome padrão", _ idade:Int = 18) {
        self.nome = nome
        self.idade = idade
    }
}
