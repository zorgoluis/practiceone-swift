//
//  ViewController.swift
//  example1
//
//  Created by Kenmeina Service Development on 18/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var optenerPalabra: UITextField!
    @IBOutlet weak var mybtn: UIButton!
    
    private let datasourceView = [
        "Cambiar texto",
        "Modificar texto",
        "Alterar texto",
        "cambio, cambio...",
        "switch texto"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        etiqueta.text = "Bienvenido";
        
        // Button
        mybtn.backgroundColor = .brown;
        mybtn.setTitleColor(.white, for: .normal);
        mybtn.setTitle("titulo add", for: .normal);
        mybtn.layer.borderWidth = 3;
        mybtn.layer.cornerRadius = 8;
        
        // PickerView
        myPickerView.dataSource = self;
        myPickerView.delegate = self;
    }

    @IBAction func cambioNombre(_ sender: Any) {
        etiqueta.text = optenerPalabra.text;
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datasourceView.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datasourceView[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myValue = datasourceView[row];
        mybtn.setTitle(myValue, for: .normal);
    }
}

