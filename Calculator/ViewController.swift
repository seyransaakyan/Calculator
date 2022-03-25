//
//  ViewController.swift
//  Calculator
//
//  Created by Seyran Saakyan on 24.03.2022.
//

import UIKit

class ViewController: UIViewController {
    var numbersToDo: Double = 0
    var firstNumber: Double = 0
    var mathSign: Bool = false
    var operation: Int = 0
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var pointButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true{
            place.text = String(sender.tag)
            mathSign = false
        } else {
            place.text = place.text! + String(sender.tag)
        }
        numbersToDo = Double(place.text!)!
    }
    
    @IBAction func buttonsToDo(_ sender: UIButton) {
        if place.text != "" && sender.tag != 17 && sender.tag != 10 && sender.tag != 12 {
            firstNumber = Double(place.text!)!
            if sender.tag == 13{ //Деление
                place.text = "÷"
            } else if sender.tag == 14{ // Умножение
                place.text = "×"
            } else if sender.tag == 15{ // Вычитание
                place.text = "-"
            } else if sender.tag == 16{ //Добавление
                place.text = "+"
            } else if sender.tag == 11{
                place.text = "%"
            }
            operation = sender.tag
            mathSign = true
        } else if sender.tag == 17{
            if operation == 13{
                place.text = String(firstNumber / numbersToDo)
            } else if operation == 14{
                place.text = String(firstNumber * numbersToDo)
            } else if operation == 15{
                place.text = String(firstNumber - numbersToDo)
            } else if operation == 16{
                place.text = String(firstNumber + numbersToDo)
            } else if operation == 11{
                place.text = String((firstNumber / 100) * numbersToDo)
            }
        } else if sender.tag == 10{
            place.text = ""
            firstNumber = 0
            numbersToDo = 0
            operation = 0
            
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        place.text = String(place.text!.dropLast())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borders(button: plusMinusButton)
        borders(button: pointButton)
        borders(button: cButton)
        borders(button: percentButton)
        borders(button: deleteButton)
    }
    func borders(button: UIButton){
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 0.25, green: 0.22, blue: 0.49, alpha: 1.00).cgColor
    }


}

