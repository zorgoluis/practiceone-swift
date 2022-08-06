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
    @IBOutlet weak var pageControlView: UIPageControl!
    @IBOutlet weak var mySegmente: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var stepperView: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgress: UIActivityIndicatorView!
    
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
        
        // PageControl
        pageControlView.numberOfPages = datasourceView.count;
        pageControlView.currentPageIndicatorTintColor = .blue;
        pageControlView.pageIndicatorTintColor = .lightGray;
    
        // Segment control
        mySegmente.removeAllSegments();
        for (index,value) in datasourceView.enumerated() {
            mySegmente.insertSegment(withTitle: value, at: index, animated: true);
        }
        mySegmente.selectedSegmentIndex = 0;
        
        // Slider
        mySlider.maximumTrackTintColor = .red;
        mySlider.minimumTrackTintColor = .yellow;
        mySlider.maximumValue = Float(datasourceView.count);
        mySlider.minimumValue = 1;
        mySlider.value = 1;
        
        // stepper
        stepperView.minimumValue = 0;
        stepperView.maximumValue = Double(datasourceView.count);
        
        // Switch
        mySwitch.isOn = true;
        mySwitch.onTintColor = .purple;
        
        // Progress
        myProgress.hidesWhenStopped = true;
    }

    @IBAction func cambioNombre(_ sender: Any) {
        etiqueta.text = optenerPalabra.text;
    }
    
    @IBAction func selectedPage(_ sender: UIPageControl) {
        myPickerView.selectRow(sender.currentPage, inComponent: 0, animated: true);
        let valueSelected = datasourceView[sender.currentPage];
        mybtn.setTitle(valueSelected, for: .normal);
        mySegmente.selectedSegmentIndex = sender.currentPage;
        mySlider.value = Float(sender.currentPage);
    }
    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
        myPickerView.selectRow(mySegmente.selectedSegmentIndex, inComponent: 0, animated: true);
        let myvalue = datasourceView[mySegmente.selectedSegmentIndex];
        mybtn.setTitle(myvalue, for: .normal);
        pageControlView.currentPage = mySegmente.selectedSegmentIndex;
        mySlider.value = Float(mySegmente.selectedSegmentIndex);
    }
    @IBAction func mySliderAction(_ sender: Any) {
        switch mySlider.value {
        case 1..<2:
            myPickerView.selectRow(0, inComponent: 0, animated: true);
            let myvalue = datasourceView[0];
            mybtn.setTitle(myvalue, for: .normal);
            pageControlView.currentPage = 0;
            mySegmente.selectedSegmentIndex = 0;
        case 2..<3:
            myPickerView.selectRow(1, inComponent: 0, animated: true);
            let myvalue = datasourceView[1];
            mybtn.setTitle(myvalue, for: .normal);
            pageControlView.currentPage = 1;
            mySegmente.selectedSegmentIndex = 1;
        case 3..<4:
            myPickerView.selectRow(2, inComponent: 0, animated: true);
            let myvalue = datasourceView[2];
            mybtn.setTitle(myvalue, for: .normal);
            pageControlView.currentPage = 2;
            mySegmente.selectedSegmentIndex = 2;
        case 4..<5:
            myPickerView.selectRow(3, inComponent: 0, animated: true);
            let myvalue = datasourceView[3];
            mybtn.setTitle(myvalue, for: .normal);
            pageControlView.currentPage = 3;
            mySegmente.selectedSegmentIndex = 3;
        default:
            myPickerView.selectRow(4, inComponent: 0, animated: true);
            let myvalue = datasourceView[4];
            mybtn.setTitle(myvalue, for: .normal);
            pageControlView.currentPage = 4;
            mySegmente.selectedSegmentIndex = 4;
        }
    }
    
    @IBAction func onchangeStepper(_ sender: UIStepper) {
        print(stepperView.value);
        mySlider.value = Float(sender.value);
        myPickerView.selectRow(Int(sender.value), inComponent: 0, animated: true);
        mySegmente.selectedSegmentIndex = Int(sender.value);
        pageControlView.currentPage = Int(sender.value);
    }
    
    @IBAction func onChngeSwitch(_ sender: UISwitch) {
        if(!sender.isOn){
            myPickerView.isHidden = true;
            myProgress.startAnimating();
        }else{
            myPickerView.isHidden = false;
            myProgress.stopAnimating();
        }
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
        pageControlView.currentPage = row;
        let myValue = datasourceView[row];
        mybtn.setTitle(myValue, for: .normal);
        mySegmente.selectedSegmentIndex = row;
        mySlider.value = Float(row);
    }
}

