//
//  ViewController.swift
//  JSON
//
//  Created by Chatterjee, Snigdhaman on 16/01/16.
//  Copyright © 2016 Chatterjee, Snigdhaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://freegeoip.net/json/")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            if error != nil {
                print("Error!!")
            } else if let urlContent = data {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    print(jsonResult["city"])
                } catch {
                    print("Json Error")
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

