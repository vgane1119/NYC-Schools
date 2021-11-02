//
//  NYCSchoolData.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 10/30/21.
//

//Model properties are marked as optional since some of them (e.g schoolEmail, faxNumber etc)
//doesn't have values from the api call.

import Foundation

struct NYCSchoolData: Codable {
    let dbn: String?
    let schoolName: String?
    let addressLine: String?
    let city: String?
    let zipCode: String?
    let phoneNumber: String?
    let finalgrades: String?
    let faxNumber: String?
    let schoolEmail: String?
    let neighborhood: String?
    let totalStudents: String?
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        
        case schoolName     = "school_name"
        case addressLine    = "primary_address_line_1"
        case phoneNumber    = "phone_number"
        case totalStudents  = "total_students"
        case faxNumber      = "fax_number"
        case schoolEmail    = "school_email"
        case zipCode        = "zip"
        case overview       = "overview_paragraph"
        
        case dbn
        case city
        case finalgrades
        case neighborhood
    }
}
