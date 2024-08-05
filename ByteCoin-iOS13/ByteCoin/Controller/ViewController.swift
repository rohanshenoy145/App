//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    
    var coinManager = CoinManager()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1

    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let country = coinManager.currencyArray[row]
        return country
    }
    
    func pickerView(_ pickerView: UIPickerView,didSelectRow row:Int,
                    inComponent component: Int)
    {
        let country = coinManager.currencyArray[row]
        coinManager.getCurrency(country)


    }
    
    func didUpdateCoinData(_ coinModel: CoinModel)
    {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format:"%.2f",coinModel.value!)
            self.currencyLabel.text = coinModel.currency
        }
    }
    
    
    func didReturnError(_ error:Error)
    {
        print(error)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        coinManager.delegate = self
        let country = coinManager.currencyArray[0]
        coinManager.getCurrency(country)
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
}

