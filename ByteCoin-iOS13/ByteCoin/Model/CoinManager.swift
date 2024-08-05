//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinManagerDelegate
{
    func didUpdateCoinData(_ coinModel: CoinModel)
    
    func didReturnError(_ error:Error)
}
struct CoinManager {
    var delegate : CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "794EE954-41C6-49E7-A96B-A3F985DECE65"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func getCurrency(_ country:String)
    {
        let urlString = "\(baseURL)/\(country)?apikey=\(apiKey)"
        self.sendRequest(urlString)
        
        
    }
    
    func sendRequest(_ urlString:String)
    {
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: self.handler)
            task.resume()

        }
    }
        
    func handler(data:Data?, response: URLResponse?, error:Error?)->Void
    {
        if let safeData = data
        {
            var model = self.parseJSON(safeData)
            if let model
            {
                self.delegate?.didUpdateCoinData(model)
            }
           
            
        }
        else{
            self.delegate?.didReturnError(error!)
        }
    }
    
    func parseJSON(_ data:Data)->CoinModel?
    {
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(CoinData.self,from:data)
            let currency = decodedData.asset_id_quote
            let value = decodedData.rate
            let coinModel = CoinModel(currency: currency, value: value)
            return coinModel
            
            
        }
        catch{
            self.delegate?.didReturnError(error)
        }
        return nil
    }
}
