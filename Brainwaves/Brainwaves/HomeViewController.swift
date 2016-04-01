//
//  HomeViewController.swift
//  Brainwaves
//
//  Created by Nikhil D'Souza on 4/1/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var outputText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputText.allowsEditingTextAttributes = false
        let myUrl = NSURL(string: "https://da6ebb8b.ngrok.io");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(responseString!)
            
            do {
                if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    print(convertedJsonIntoDict)
                    
                    let value = convertedJsonIntoDict["Y"]!["quality"] as? Int
                    print(value!)
                    
                    dispatch_async(dispatch_get_main_queue(), {() -> Void in
                        self.outputText.text = String(value!)
                    })
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}
