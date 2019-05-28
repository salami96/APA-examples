//
//  ViewController.swift
//  challenge4
//
//  Created by Gabriel Zanatto Salami on 10/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var body: UITextView!
    var messages = Array<Message>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self;
        subject.delegate = self;
        phone.delegate = self;
        body.delegate = self;
        body.allowsEditingTextAttributes = true;
        
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    func isNull(field: UITextField) -> Bool {
        if field == phone || field == email || field == subject {
            if field.text!.isEmpty{
                field.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.5294117647, blue: 0.4352941176, alpha: 1)
                field.placeholder = "Campo Obrigatório"
                return true
            } else {
                return false
            }
        }
        return true
    }

    
    @IBAction func bold(_ sender: UIButton) {
    }
    @IBAction func italic(_ sender: UIButton) {
    }
    @IBAction func underline(_ sender: UIButton) {
    }
    
    func alert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func send(_ sender: UIButton) {
        if (isNull(field: email) || isNull(field: subject) || isNull(field: phone)){
            alert(title: "Erro", msg: "Verifique os campos vazios.")
        } else if body.text.isEmpty {
            body.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.5294117647, blue: 0.4352941176, alpha: 1)
            alert(title: "Erro", msg: "Campo corpo do email é obrigatório!")
        } else if validateEmail(enteredEmail: email.text!){
            let m = Message(to: email.text!, subject: subject.text!, phone: phone.text!, body: body.text!)
            print(m.printMessage())
            messages.append(m)
            email.text = ""
            phone.text = ""
            subject.text = ""
            body.text = ""
            alert(title: "Sucesso", msg: "Mensagem enviada com Sucesso! \n" + m.printMessage());
        } else {
            email.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.5294117647, blue: 0.4352941176, alpha: 1)
            alert(title: "Erro", msg: "Email inválido")
        }
    }
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if phone == textField {
            let tamanho = phone.text?.count;
            if tamanho! < 13 {
                if (string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "0" || string == "" ) {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return true;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if email == textField{
            let emailText = email.text!;
            if validateEmail(enteredEmail: emailText){
                email.backgroundColor = #colorLiteral(red: 0.4635562897, green: 0.5919961333, blue: 0.3411408067, alpha: 1);
            } else {
                email.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.5294117647, blue: 0.4352941176, alpha: 1);
            }
            
        }
    }
    
    
    /*func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
     print(range);
     return true;
     }*/
    
    
}

