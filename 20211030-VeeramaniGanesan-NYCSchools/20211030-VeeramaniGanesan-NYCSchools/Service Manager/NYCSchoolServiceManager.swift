//
//  NYCSchoolServiceManager.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 10/30/21.
//

//NYCSchoolServiceManager - Service maanger to send requet and receive data from / to server.
//It supports "GET" method calls and returns the result via completion handler. This class can be
//extended to support other http methods like POST, PUT etc.

import Foundation

class NYCSchoolServiceManager {
    fileprivate static let APIBaseURL = "https://data.cityofnewyork.us/"
    
    func sendRequest(withUrl url: String, andCompletionHandler handler: @escaping (_ data: Data?, _ error: Error?)-> Void)
    {
       let request = self.prepareRequest(withUrl: url)
        URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            if (response as? HTTPURLResponse) != nil {
                if let httpData = data {
                    handler(httpData, nil)
                }
            }
            else {
                handler(nil, self?.errorForMessage(message: "Invalid Response"))
            }
        }).resume()
    }

    private func prepareRequest(withUrl url: String)-> (URLRequest) {
        var endPointUrl = NYCSchoolServiceManager.APIBaseURL + url
        endPointUrl = endPointUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let urlRequest = URLRequest(url: URL(string: endPointUrl)!)
        return urlRequest
    }
    
    private func errorForMessage(message: String)->Error {
        return NSError(domain: "com.self.20211030-VeeramaniGanesan-NYCSchools", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
