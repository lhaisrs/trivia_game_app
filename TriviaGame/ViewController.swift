//
//  ViewController.swift
//  TriviaGame
//
//  Created by Lhais Rodrigues Silva on 17/11/17.
//  Copyright © 2017 Lhais Rodrigues Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Label de Pergunta
    @IBOutlet weak var myPergunta: UILabel!
    //TextField de Resposta
    @IBOutlet weak var myResposta: UITextField!
    //Label de Contagem de Pontos
    @IBOutlet weak var myPontos: UILabel!
    //Setando o index da coleção
    //Ajudando o tamanho da fonte do título
    //@IBOutlet weak var mySliderFonte: UISlider!
    var index: Int = 0;
    //Criando meu contador de pontos
    var pontos: Int = 4;
    //Contador de tentativas
    var tentativas: Int = 4;
    //Criando a Coleção de perguntas
    var questoes:[Questao] = [];
    //Label do Título
    @IBOutlet weak var myTitle: UILabel!
    //Label de Feedback
    //@IBOutlet weak var myFeedback: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Desabilitando meu TextField
        myResposta.delegate = self
        
        //Inicializando na Label de Pontos
        myPontos.text = String (pontos);
        
        //Hidden Feedback
        //myFeedback.isHidden = true;
        
        //Setando o Título pelo Slider
        //mySliderFonte.value = 12;
        //myTitle.font = myTitle.font.withSize(CGFloat (mySliderFonte.value));
        
        //Criando as perguntas e respostas
        let questao1 = Questao(pergunta: "Qual o nome da capital de Butão?", resposta: "Thimbu");
        
        let questao2 = Questao(pergunta: "Em que ano Swift 1.0 tornou-se disponível?", resposta: "2014");
        
        let questao3 = Questao(pergunta: "O que está escrito no Anel de Sauron no lado externo?", resposta: "Um Anel para a todos governar, um Anel para encontrá-los");
        
        let questao4 = Questao(pergunta: "Qual estado do Brasil pertence a ilha de Fernando de Noronha?", resposta: "Pernambuco");
        
        //Adicionando as perguntas a coleção
        questoes.append(questao1);
        questoes.append(questao2);
        questoes.append(questao3);
        questoes.append(questao4);
        
        //Setando a Label de Pergunta
        myPergunta.text = questoes[index].Pergunta;
    }
    
    //Analisando o TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    
    //Enviar respostas
    @IBAction func EnviarResposta(_ sender: UIButton) {
        
        if(tentativas > 0){
            let alertControllerSucess = UIAlertController(title: "Acertou!", message: "Parabéns cara, você é fera!", preferredStyle: UIAlertControllerStyle.alert);
            
            let alertControllerError = UIAlertController(title: "Errou!", message: "Você é muito burro cara!", preferredStyle: UIAlertControllerStyle.alert);
            
            let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil);
            
            alertControllerError.addAction(action);
            alertControllerSucess.addAction(action);
            
            //Validando a resposta
            if(myResposta.text == questoes[index].Resposta) {
                
                self.present(alertControllerSucess, animated: true, completion: nil)
                
                pontos = pontos + 1;
                
            } else {
                
                self.present(alertControllerError, animated: true, completion: nil)
                
                pontos = pontos - 1;
            }
            
            tentativas = tentativas - 1;
            myPontos.text = String (pontos);
            
            
            if(index < 3) {
                
                index = index + 1;
                myPergunta.text = questoes[index].Pergunta;
                myResposta.text = "";
            } else {
                tentativas = 0;
                self.EnviarResposta(sender);
            }
            
        } else {
            
            //Mostrando o Feedback
            //            myFeedback.isHidden = false;
            //
            //
            //            if(pontos > 4) {
            //                myFeedback.text = "Você ganhou! Parabéns Cara! Você é fera.";
            //            } else {
            //                myFeedback.text = "Você perdeu Você é muito burro cara!";
            //            }
            
            //Realizando a navegação
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

