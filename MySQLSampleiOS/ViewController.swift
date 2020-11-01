//
//  ViewController.swift
//  MySQLSampleiOS
//
//  Created by cipi on 25/12/15.
//
//

import UIKit
import MySQLDriveriOS

class ViewController: UIViewController {

    @IBOutlet weak var pswTxtField: UITextField!
    @IBOutlet weak var usrTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func Submit(_ sender: Any) {
        
        let con = MySQL.Connection()
        let db_name = "Username"
        do{
            /*
            try con.open("localhost", user: "root", passwd:"")
            try con.use(db_name)
            let slect_stmt = try con.prepare("SELECT * FROM user WHERE name=? and password=SHA1(?)")
            try slect_stmt.exec([usrTxtField.text!, pswTxtField.text!])
            print("Connected")
            print(slect_stmt)
          try con.close()
                */
    
          
            
            
            
            try con.open("localhost", user: "root", passwd:"")
            print("Connected Good :D")
            
            try con.use(db_name)
            //let select_query = try con.prepare("SELECT * FROM User")
            let table = MySQL.Table(tableName: "User", connection: con);
          
          
            if let rows = try table.select(Where: ["password=SHA1(",pswTxtField.text!,") AND name=",usrTxtField.text!]){
                if rows.isEmpty {
                    let alert = UIAlertController(title: "Error", message: "Invanid Username/Password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    print("Invalid Username/Password")
                }
 
                else{
                    let alert = UIAlertController(title: "Welcome", message: "Bienvenido al sistema", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
               // print(rows)
                
                }
                
            }
            
            
            
            try con.close()
            
        }
            
            
        catch (let error){
            print(error)
            let alert = UIAlertController(title: "ERROR", message: "Sistema en Mantenimiento, Intente mas tarde", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

