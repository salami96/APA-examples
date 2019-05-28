//
//  ViewController.swift
//  Challenge2
//
//  Created by Gabriel Zanatto Salami on 08/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var body: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self;
        subject.delegate = self;
        phone.delegate = self;
        body.delegate = self;
        body.allowsEditingTextAttributes = true;
        
    }

    @IBAction func bold(_ sender: UIButton) {
    }
    @IBAction func italic(_ sender: UIButton) {
    }
    @IBAction func underline(_ sender: UIButton) {
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        
        if phone == textField {
            let tamanho = phone.text?.count;
            if tamanho! < 13 {
                if (string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "0" ) {
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
                email.textColor = #colorLiteral(red: 0.4635562897, green: 0.5919961333, blue: 0.3411408067, alpha: 1);
            } else {
                email.textColor = #colorLiteral(red: 1, green: 0.5076294541, blue: 0.4370341301, alpha: 1);
            }
            
        }
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    /*func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(range);
        return true;
    }*/
    
    
}

