//
//  NYCSchoolDataViewModel.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 11/1/21.
//

//NYCSchoolDataService - This class can fetch schools details from server and notify the view
//controller via data binding for UI update.

import Foundation

class NYCSchoolDataViewModel {
    
    var bindViewModelToController: (()->()) = {}
    private var schoolDataService: NYCSchoolDataService?
    private var schoolData: [NYCSchoolData]? {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    init() {
        schoolDataService = NYCSchoolDataService()
        fetchSchoolData()
    }
    
    func fetchSchoolData() {
        schoolDataService?.fetchData(withCompletionHandler: { [weak self] data in
            self?.schoolData = data
        })
    }
    
    func getSchoolData()-> [NYCSchoolData]? {
        return schoolData
    }
}
