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
        AlertManager.shared.showAlert(parent: self,
                                      title: "No data is available",
                                      body: "Please check device instructions.",
                                      buttonTitles: ["OK"]) { _ in
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.slideLeftViews(delay: 0.2)
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
        if coffee?.id == nfcValidID {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SelectCoffeeViewController") as! SelectCoffeeViewController
            vc.data = coffee?.types.compactMap({$0.name}) ?? []
            navigationController?.pushViewController(vc, animated: true)
        } else {
            AlertManager.shared.showAlert(parent: self,
                                          title: "Invalid Device!",
                                          body: "Please contact the operator",
                                          buttonTitles: ["OK"]) { _ in
            }
        }
    }

}

//MARK: - API Request
extension ScanViewController {
    
    func fetchData() {
        APIManager.shared.getCafeProductionData(useMockData: useMockData, completion: { result in
            switch result {
            case .success(let data):
                coffee = data
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
                    return
                }
            })
        case .timeout:
            print(error)
            AlertManager.shared.showAlert(parent: self,
                                          title: "Request timeout",
                                          body: "Please try again",
                                          buttonTitles: ["Try again", "More"],
                                          style: .alert, showCancelButton: false,
                                          completion: {index in
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
