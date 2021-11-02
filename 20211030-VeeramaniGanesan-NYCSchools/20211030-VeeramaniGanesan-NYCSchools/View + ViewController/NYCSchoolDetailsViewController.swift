//
//  NYCSchoolDetailsViewController.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 10/30/21.
//

import UIKit

class NYCSchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var schoolNameValueLabel: UILabel!
    @IBOutlet weak var addressValueLabel: UILabel!
    @IBOutlet weak var cityValueLabel: UILabel!
    @IBOutlet weak var zipcodeValueLabel: UILabel!
    @IBOutlet weak var phoneValueLabel: UILabel!
    @IBOutlet weak var faxValueLabel: UILabel!
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var gradesValueLabel: UILabel!
    @IBOutlet weak var neighboorValueLabel: UILabel!
    @IBOutlet weak var totalStudentsValueLabel: UILabel!
    
    @IBOutlet weak var satTestTakersValueLabel: UILabel!
    @IBOutlet weak var satReadingScoreValueLabel: UILabel!
    @IBOutlet weak var satWritingScoreValueLabel: UILabel!
    @IBOutlet weak var satMathScoreValueLabel: UILabel!
    
    @IBOutlet weak var overviewValueLabel: UILabel!
    
    private var schoolData: NYCSchoolData?
    private var schoolSATData: NYCSchoolSATData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let schoolData = self.schoolData {
            updateDetailsViewWithSchoolData(schoolData)
        }
        if let schoolSATData = self.schoolSATData {
            updateDetailsViewWithSATData(schoolSATData)
        }
    }
    
    func setSchoolDetails(_ schoolData: NYCSchoolData?, schoolSATData: NYCSchoolSATData?) {
        self.schoolData = schoolData
        self.schoolSATData = schoolSATData
    }
}


extension NYCSchoolDetailsViewController {
    
    private func updateDetailsViewWithSchoolData(_ schoolData: NYCSchoolData) {
        schoolNameValueLabel.text       = schoolData.schoolName ?? "NA"
        addressValueLabel.text          = schoolData.addressLine ?? "NA"
        cityValueLabel.text             = schoolData.city ?? "NA"
        zipcodeValueLabel.text          = schoolData.zipCode ?? "NA"
        phoneValueLabel.text            = schoolData.phoneNumber ?? "NA"
        faxValueLabel.text              = schoolData.faxNumber ?? "NA"
        emailValueLabel.text            = schoolData.schoolEmail ?? "NA"
        gradesValueLabel.text           = schoolData.finalgrades ?? "NA"
        neighboorValueLabel.text        = schoolData.neighborhood ?? "NA"
        totalStudentsValueLabel.text    = schoolData.totalStudents ?? "NA"
        overviewValueLabel.text         = schoolData.overview ?? "NA"
    }
    
    private func updateDetailsViewWithSATData(_ satData: NYCSchoolSATData) {
        satTestTakersValueLabel.text    = satData.numOfTestTakers ?? "NA"
        satReadingScoreValueLabel.text  = satData.satReadingScore ?? "NA"
        satWritingScoreValueLabel.text  = satData.satWritingScore ?? "NA"
        satMathScoreValueLabel.text     = satData.satMathScore ?? "NA"
    }
}
