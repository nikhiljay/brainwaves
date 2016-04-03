//
//  HomeViewController.swift
//  Brainwaves
//
//  Created by Nikhil D'Souza on 4/1/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class HomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var outputText: UITextView!
    @IBOutlet weak var serverTextField: UITextField!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    var serverURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadIndicator.stopAnimating()
        serverTextField.delegate = self
        repeatRequest()
        
    }
    
    func repeatRequest() {
        if serverURL != nil {
            _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(HomeViewController.getRequest), userInfo: nil, repeats: true)
        } else {
            self.outputText.text = "Enter a server URL!"
        }
    }
    
    func getRequest() {
        
        loadIndicator.stopAnimating()
        
        Alamofire.request(.GET, serverURL!)
            .responseJSON { response in
                if let JSON = response.result.value {
                    
                    self.outputText.text = ""
                    
                    for node in JSON as! [String: AnyObject] {
                        let nodeData = node.1["value"]!
                        self.outputText.text! += node.0 + ": " + String(nodeData!) + "\n"
                    }
                    
                }
                
                switch response.result {
                case .Success:
                    print("Validation Successful")
                case .Failure(let error):
                    self.outputText.text = String(error)
                    print(error)
                }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        serverURL = serverTextField.text
        repeatRequest()
        loadIndicator.startAnimating()
        return true
    }
    
}
