//
//  NYCSchoolSATData.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 10/30/21.
//

import Foundation

struct NYCSchoolSATData: Codable {
    let dbn: String?
    let numOfTestTakers: String?
    let satReadingScore: String?
    let satMathScore: String?
    let satWritingScore: String?
    
    enum CodingKeys:String, CodingKey {
        
        case numOfTestTakers    = "num_of_sat_test_takers"
        case satReadingScore    = "sat_critical_reading_avg_score"
        case satMathScore       = "sat_math_avg_score"
        case satWritingScore    = "sat_writing_avg_score"
        case dbn
    }
}
