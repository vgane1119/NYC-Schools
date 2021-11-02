//
//  _0211030_VeeramaniGanesan_NYCSchoolsTests.swift
//  20211030-VeeramaniGanesan-NYCSchoolsTests
//
//  Created by Ganesan, Veeramani on 10/30/21.
//

//Some unit test cases are added below to test the view model and api call performaces for school
//details and sat score. If get time, would like to add mockAPIService to provide the data offline
//to unit test the view models in off line mode. Also, would like to add unit tests for models and
//ui navigations.

import XCTest
@testable import _0211030_VeeramaniGanesan_NYCSchools

var sutSchoolDataViewModel: NYCSchoolDataViewModel!
var sutSATDataViewModel: NYCSchoolSATDataViewModel!

class _0211030_VeeramaniGanesan_NYCSchoolsTests: XCTestCase {
    
    override class func setUp() {
        sutSchoolDataViewModel = NYCSchoolDataViewModel()
        sutSATDataViewModel = NYCSchoolSATDataViewModel()
    }
    
    override class func tearDown() {
        sutSchoolDataViewModel = nil
        sutSATDataViewModel = nil
    }

    func testSchoolDataViewModel() throws {
        sutSchoolDataViewModel.fetchSchoolData()
        XCTAssert(sutSchoolDataViewModel.getSchoolData() != nil)
    }
    
    func testSchoolSATDataViewModel() throws {
        sutSATDataViewModel.fetchSchoolSATData()
        XCTAssert(sutSATDataViewModel.getSATDataForSchool(dbn: "01M292") != nil)
        XCTAssert(sutSATDataViewModel.getSATDataForSchool(dbn: "FFFFFF") == nil)
    }
    
    func testSchoolDataLoadPerformance() throws {
        self.measure {
            NYCSchoolDataService().fetchData { schoolData in }
        }
    }
    
    func testSchoolSATDataLoadPerformance() throws {
        // This is an example of a performance test case.
        self.measure {
            NYCSchoolSATDataService().fetchData { schoolSATData in }
        }
    }
}
