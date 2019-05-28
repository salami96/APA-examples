//
//  ViewController.swift
//  Text field e text view
//
//  Created by Gabriel Zanatto Salami on 08/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        text.delegate = self;
        textView.delegate = self;
        textView.allowsEditingTextAttributes = true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.placeholder);
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string == "1" || string == "2" || string == "3" || string == "4" || string == "u" || string == "") {
            return true
        } else {
            return false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text);
    }
}

