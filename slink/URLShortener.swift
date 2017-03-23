//
//  URLShortener.swift
//  slink
//
//  Created by Christopher Hannah on 23/03/2017.
//  Copyright © 2017 Christopher Hannah. All rights reserved.
//

import Foundation

class URLShortener {

    let baseURL = "https://www.googleapis.com/urlshortener/v1/url"
    let apiKey = "AIzaSyDFUGX07TKLOZtyjBX4I-8FxK_jIvMkoxY"
    
    func shortenURL(longURL: String) -> String {
        let semaphore = DispatchSemaphore(value: 0)
        
        let requestData = try! JSONSerialization.data(withJSONObject: ["longUrl": longURL], options: [])
        let requestURL = URL(string: "\(baseURL)?key=\(apiKey)")!
        let request = NSMutableURLRequest(url: requestURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = requestData
        
        var shortURL = ""
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (responseData, response, error) in
            if error != nil {
                semaphore.signal()
            }
            
            if let data = responseData {
                let parsedData = try? JSONSerialization.jsonObject(with: data, options: [])
                let dict = parsedData as? NSDictionary
                
                if let url = dict?["id"] {
                    shortURL = url as! String
                }
            }
            semaphore.signal()
            
        }

        task.resume()
        semaphore.wait()
        
        return shortURL
    }
    
    func expandURL(shortURL: String) -> String {
        let semaphore = DispatchSemaphore(value: 0)
        
        let requestURL = URL(string: "\(baseURL)?key=\(apiKey)&shortUrl=\(shortURL)")!
        let request = NSMutableURLRequest(url: requestURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        var expandedURL = "error"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (responseData, response, error) in
            if error != nil {
                semaphore.signal()
            }
            
            if let data = responseData {
                let parsedData = try? JSONSerialization.jsonObject(with: data, options: [])
                let dict = parsedData as? NSDictionary
                if let url = dict?["longUrl"] {
                    expandedURL = url as! String
                }
            }
            semaphore.signal()
            
        }
        
        task.resume()
        semaphore.wait()
        
        return expandedURL
    }
    
    
    

}

