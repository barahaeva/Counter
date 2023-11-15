//
//  ViewController.swift
//  Counter
//
//  Created by Karina ❦ on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changesView: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var reduceButton: UIButton!
    
    var count = 0
    
    @IBAction func addCount(_ sender: Any) {
        count += 1
        countLabel.text = "\(count)"
        changesView.text += "\n \(Date().formatted()): Значение изменено на +1"
    }
    
    @IBAction func reduceCount(_ sender: Any) {
        if count > 0 {
            count -= 1
            countLabel.text = "\(count)"
            changesView.text += "\n \(Date().formatted()): Значение изменено на -1"
        } else {
            changesView.text += "\n \(Date().formatted()): Попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction func resetCount(_ sender: Any) {
        count = 0
        countLabel.text = "\(count)"
        changesView.text += "\n \(Date().formatted()): Значение сброшено"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

