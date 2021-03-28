//
//  ViewController.swift
//  ReadFromFile
//
//  Created by zeons on 28.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
        
    }
}

