//
//  ViewController.swift
//  FilmLocations
//
//  Created by Angelina Olmedo on 4/15/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getDataFromFile(_ fileName:String){
        let path = Bundle.main.path(forResource: "nameOfYourFile", ofType: ".json")
        if let path = path {
          let url = URL(fileURLWithPath: path)
          print(url)
        }
    }



}

