//
//  RegisterViewController.swift
//  MySQLSampleiOS
//
//  Created by athos on 10/31/20.
//

import UIKit
import MySQLDriveriOS
class RegisterViewController: UIViewController {
    @IBOutlet weak var usrTxtField: UITextField!
    @IBOutlet weak var mailTxtField: UITextField!
    @IBOutlet weak var pswTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

 
    @IBAction func RegisterAction(_ sender: Any) {
        struct obj {
            var iint8 : Int8 = -1
            var uint8: UInt8 = 1
            var int16 : Int16 = -1
            var uint16: UInt16 = 1
            var id:Int = 1
            var count:UInt = 10
            var uint64 : UInt64 = 19999999999
            var int64 : Int64 = -19999999999
            var ffloat : Float = 1.1
            var ddouble : Double = 1.1
            var ddate = NSDate()
            var str = "test string"
           // var ddata = "test data".dataUsingEncoding(NSUTF8StringEncoding)!
        }
        
        let con = MySQL.Connection()
        let db_name = "Username"
        do{
            
            
            if usrTxtField.text == "" {
                let alert = UIAlertController(title: "Error", message: "User is Empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                try con.close()
            }
           else if pswTxtField.text == "" {
                let alert = UIAlertController(title: "Error", message: "Password is Empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                try con.close()
            }
            
            else if mailTxtField.text == "" {
                let alert = UIAlertController(title: "Error", message: "Email is Empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                try con.close()
            }
            
          else if usrTxtField.text == "" && pswTxtField.text == "" && mailTxtField.text == ""{
                let alert = UIAlertController(title: "Error", message: "User is Empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                try con.close()
            }
                
            else{
                try con.open("localhost", user: "root", passwd: "")
                print("Connected, OK")
                try con.use(db_name)
                //let table = MySQL.Table(tableName: "User", connection: con)
               // let objeto = obj();
                
                let inst_stmt = try con.prepare("INSERT INTO User(name,email,password) VALUES(?,?,SHA1(?))")
                try inst_stmt.exec([usrTxtField.text!,mailTxtField.text!,pswTxtField.text!])
                let alert = UIAlertController(title: "Congratulations", message: "User Register", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
    }
        catch(let e){
            print(e)
        }
}
}
