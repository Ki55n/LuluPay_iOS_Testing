//
//  ViewController.swift
//  TenentApplication
//
//  Created by boyapati kumar on 30/01/25.
//

import UIKit
import LuluSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func payBtnAction(_ sender: UIButton) {
        // load frame work
        let frameworkVC = MyStoryboardLoader.instantiateViewController()
        frameworkVC.modalPresentationStyle = .fullScreen
        present(frameworkVC, animated: true, completion: nil)
    }


}

