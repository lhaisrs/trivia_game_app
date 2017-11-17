//
//  Questao.swift
//  TriviaGame
//
//  Created by Lhais Rodrigues Silva on 17/11/17.
//  Copyright © 2017 Lhais Rodrigues Silva. All rights reserved.
//

import Foundation

class Questao {
    var Pergunta: String;
    var Resposta: String;
    
    init(pergunta: String, resposta: String){
        self.Pergunta = pergunta;
        self.Resposta = resposta;
    }
}
