//
//  ViewController.swift
//  NASAOpenAPIDemo
//
//  Created by 楊朝富 on 2021/7/21.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnRequestPress(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoSecondPage", sender: nil)
    }
    
}

