//
//  ScanViewController.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class ScanViewController: UIViewController {

    @IBOutlet weak var mechineImage: UIImageView!
    @IBOutlet weak var helpButton: UIButton!
    @IBAction func helpButtonAction(_ sender: Any) {
        print("how does this work, tapped!")
    }
    
    let nfcScanIdentification = "60ba1ab72e35f2d9c786c610"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        title = "Dark Roasted Beans"
        navigationController?.navigationBar.prefersLargeTitles = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapAction))
        mechineImage.addGestureRecognizer(tap)
        mechineImage.isUserInteractionEnabled = true
        helpButton.underline()
    }
    
    @objc func imageTapAction() {
        fetchData()
//        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectCoffeeViewController") as! SelectCoffeeViewController
//        navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: - API Request
extension ScanViewController {
    
    func fetchData() {
        APIManager.shared.getCafeProductionData(useMockData: useMockData, completion: { result in
            switch result {
            case .success(let data):
                cafeProduction = data
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlertAndHandleEvent(error)
                    
            }
        })
    
    }
}

//MARK: - Alert Manager
extension ScanViewController {
    
    func showAlertAndHandleEvent(_ error: ApplicationError) {
        switch error {
        case .badURL, .decode:
            AlertManager.shared.showAlert(parent: self, title: "Network failure", body: "Please check your Internet", buttonTitles: [], style: .alert, showCancelButton: true, completion: {index in
                self.showAlertAndHandleEvent(.badURL)
            })
        case .general:
            print(error)
            AlertManager.shared.showAlert(parent: self, title: "Error", body: "Please check your Internet", buttonTitles: ["Try again"], style: .alert, showCancelButton: true, completion: {index in
                if let index = index {
                    if index == 0 {
                        self.fetchData()
                    }
                } else {
                    //
                }
            })
        case .timeout:
            print(error)
            AlertManager.shared.showAlert(parent: self, title: "Request timeout", body: "Please try again", buttonTitles: ["Try again", "More"], style: .alert, showCancelButton: true, completion: {index in
                if index == 0 {
                    self.fetchData()
                } else {
                    return
                }
            })
        case .noData:
            print("No data ", error)
        }
    }
}
