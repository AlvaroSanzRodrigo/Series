//
//  LoginViewController.swift
//  Series
//
//  Created by Álvaro Sanz Rodrigo on 3/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    @IBAction func login(_ sender: UIButton) {
        if txtUsername.text == "Sanz"  && txtPwd.text == "millones"{
            showSeriesVC()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSeriesVC() {
        let seriesVC = SeriesViewController()
        let navigationController = navigationController.modalTransitionStyle = .flipHorizontal
        present(navigationController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
