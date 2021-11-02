//
//  NYCSchoolDataService.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 10/30/21.
//

// NYCSchoolDataService - This class can send request to the server to get nyc schools details and
//send back the result via callback. Would like to add cache features if get time.

import Foundation

class NYCSchoolDataService {
    
    fileprivate static let SchoolsDataAPI = "resource/s3k6-pzi2.json/"
    
    func fetchData(withCompletionHandler handler: @escaping ([NYCSchoolData]?) -> Void) {
        NYCSchoolServiceManager().sendRequest(withUrl: NYCSchoolDataService.SchoolsDataAPI) { [weak self] data, error in
            if error != nil {
                print ("NYCSchoolDataService Fetch Error: \(String(describing: error))")
                handler(nil)
            }
            else {
                guard let data = data else { return handler(nil) }
                handler(self?.parseData(response: data))
            }
        }
    }
    
    func parseData(response: Data) -> [NYCSchoolData]? {
        do {
            let valueFromJSON = try JSONSerialization.jsonObject(with: response, options: .fragmentsAllowed)
            let jsonData = try JSONSerialization.data(withJSONObject: valueFromJSON, options: [])
            let schoolData = try JSONDecoder().decode([NYCSchoolData].self, from: jsonData)
            return schoolData
        }
        catch {
            print("NYCSchoolDataService Parser Error!!! \(error)")
            return nil
        }
    }
}
