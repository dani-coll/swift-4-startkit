//
//  ViewController.swift
//  swift-4-startkit
//
//  Created by Daniel C L on 30/05/2018.
//  Copyright © 2018 Daniel C L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.makeGetCall(endpoint: "http://quiet-stone-2094.herokuapp.com/rates.json", onCompletion: { json, err in
            print("Rates")
            print(json)
        })
        ApiService.makeGetCall(endpoint: "http://quiet-stone-2094.herokuapp.com/transactions.json", onCompletion: { json, err in
            print("Transactions")
            print(json)
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

