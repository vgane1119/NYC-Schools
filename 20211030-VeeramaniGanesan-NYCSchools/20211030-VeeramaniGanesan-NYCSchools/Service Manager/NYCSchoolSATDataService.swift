//
//  NYCSchoolSATDataService.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 11/1/21.
//

// NYCSchoolSATDataService - This class can send request to the server to get nyc school sat details and send back the result via callback.

import Foundation

class NYCSchoolSATDataService {
    fileprivate static let SATDataAPI = "resource/f9bf-2cp4.json/"
    
    func fetchData(withCompletionHandler handler: @escaping ([NYCSchoolSATData]?) -> Void) {
        NYCSchoolServiceManager().sendRequest(withUrl: NYCSchoolSATDataService.SATDataAPI) { [weak self] data, error in
            if error != nil {
                print ("NYCSchoolSATDataService Fetch Error: \(String(describing: error))")
                handler(nil)
            }
            else {
                guard let data = data else { return handler(nil) }
                handler(self?.parseData(response: data))
            }
        }
    }
    
    func parseData(response: Data) -> [NYCSchoolSATData]? {
        do {
            let valueFromJSON = try JSONSerialization.jsonObject(with: response, options: .fragmentsAllowed)
            let jsonData = try JSONSerialization.data(withJSONObject: valueFromJSON, options: [])
            let satData = try JSONDecoder().decode([NYCSchoolSATData].self, from: jsonData)
            return satData
        }
        catch {
            print("NYCSchoolSATDataService Parser Error!!! \(error)")
            return nil
        }
    }
}
