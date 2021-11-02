//
//  NYCSchoolSATDataViewModel.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 11/1/21.
//

// NYCSchoolDataService - This class can fetch schools sat details from the server, store the sat data and allows the view controller to pull the details and present it in the view on demand basis.

import Foundation

class NYCSchoolSATDataViewModel {
    
    private var schoolSATDataService: NYCSchoolSATDataService?
    private var schoolSATData: [NYCSchoolSATData]?
    
    init() {
        schoolSATDataService = NYCSchoolSATDataService()
        fetchSchoolSATData()
    }
    
    func fetchSchoolSATData() {
        schoolSATDataService?.fetchData(withCompletionHandler: { [weak self] data in
            self?.schoolSATData = data
        })
    }
    
    func getSATDataForSchool(dbn: String)-> NYCSchoolSATData? {
        return schoolSATData?.filter{ return $0.dbn == dbn }.first
    }
}
