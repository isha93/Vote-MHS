//
//  ViewController.swift
//  vote-mhs-swift
//
//  Created by isa nur fajar on 28/11/19.
//  Copyright © 2019 isa nur fajar. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBAction func actionBtnLogin(_ sender: UIButton) {
        signIn(email: username.text ?? "", pass: pass.text ?? ""){_ in ();
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func signIn(email : String, pass : String, completionBlock : @escaping (_ success :Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error , let _ = AuthErrorCode(rawValue: error._code){
                let alert = UIAlertController(title: "Oppsss!!", message: "Password atau email anda salah silahkan periksa kembali", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    print(action)
                }))
                self.present(alert, animated: true, completion: nil)
            }else{
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "goToDetail", sender: nil)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HomeController{
            let vc = segue.destination as? HomeController
//            vc?.username = "isa"
            
        }
    }

}

