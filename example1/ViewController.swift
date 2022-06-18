//
//  ViewController.swift
//  example1
//
//  Created by Kenmeina Service Development on 18/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var optenerPalabra: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        etiqueta.text = "Bienvenido";
    }

    @IBAction func cambioNombre(_ sender: Any) {
        etiqueta.text = optenerPalabra.text;
    }
    
}

