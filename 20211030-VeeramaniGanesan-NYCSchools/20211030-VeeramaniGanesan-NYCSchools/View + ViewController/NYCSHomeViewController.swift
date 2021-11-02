//
//  NYCSHomeViewController.swift
//  20211030-VeeramaniGanesan-NYCSchools
//
//  Created by Ganesan, Veeramani on 10/30/21.
//

//Would like to add features like pull down to refresh, search schools by school name etc when get
//time.

import UIKit

class NYCSHomeViewController: UIViewController {

    @IBOutlet weak var schoolInfoTableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private var schoolDataViewModel: NYCSchoolDataViewModel?
    private var schoolSATDataViewModel: NYCSchoolSATDataViewModel?
    private var schoolData: [NYCSchoolData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSchoolInfoTableView()
        loadSchoolDataAndUpdateUI()
        loadSchoolSATData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedDetailsViewController = segue.destination as? NYCSchoolDetailsViewController, let sender = sender as? NYCSTableViewCell, let schoolData = schoolData {
            let schoolData = schoolData[sender.tag]
            let schoolSATData = schoolSATDataViewModel?.getSATDataForSchool(dbn: schoolData.dbn ?? "")
            selectedDetailsViewController.setSchoolDetails(schoolData, schoolSATData: schoolSATData)
        }
    }
}

extension NYCSHomeViewController {
    
    private func setupSchoolInfoTableView() {
        schoolInfoTableView.isHidden = true
        schoolInfoTableView.backgroundColor = UIColor.clear
        schoolInfoTableView.separatorColor = UIColor.white
        schoolInfoTableView.dataSource = self
    }
    
    private func loadSchoolDataAndUpdateUI() {
        activityIndicatorView.startAnimating()
        schoolDataViewModel = NYCSchoolDataViewModel()
        schoolDataViewModel?.bindViewModelToController = { [weak self] in
            
            self?.schoolData = self?.schoolDataViewModel?.getSchoolData()
            DispatchQueue.main.async {
                self?.activityIndicatorView.stopAnimating()
                if self?.schoolData == nil || self?.schoolData?.count == 0 {
                    self?.errorLabel.isHidden = false
                    self?.schoolInfoTableView.isHidden = true
                }
                else {
                    self?.errorLabel.isHidden = true
                    self?.schoolInfoTableView.isHidden = false
                    self?.schoolInfoTableView.reloadData()
                }
            }
        }
    }
    
    private func loadSchoolSATData() {
        schoolSATDataViewModel = NYCSchoolSATDataViewModel()
        schoolSATDataViewModel?.fetchSchoolSATData()
    }
}

extension NYCSHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schoolData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "NYCSTableViewCellId", for: indexPath) as! NYCSTableViewCell
        
        if let schoolData = self.schoolData, indexPath.row < schoolData.count {
            let value = schoolData[indexPath.row]
            tableViewCell.tag = indexPath.row
            tableViewCell.schoolNameLabel.text = value.schoolName
            tableViewCell.cityLabel.text = value.city
            tableViewCell.gradeLabel.text = "Grades: " + (value.finalgrades ?? "NA")
        }
        return tableViewCell
    }
}
