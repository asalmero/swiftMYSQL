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
            let obj : MySQL.Row = [
                "oint": Int?(0),
                "iint8" : Int8(-1),
                "uint8": UInt8(1),
                "int16" : Int16(-1),
                "uint16": UInt16(100),
                "id":Int(1),
                "count":UInt?(10),
                "uint64" : UInt64(19999999999),
                "int64" : Int64(-19999999999),
                "ffloat" : Float(1.1),
                "ddouble" : Double(1.1),
                //"ddate" : NSDate((dateString: "2015-11-10")),
                "str" : "test string",
                //"nsdata" : "test data".dataUsingEncoding(NSUTF8StringEncoding)!,
                "uint8_array" : [UInt8]("test data uint8 array".utf8),
                ]
          
            
            
            
            try con.open("localhost", user: "root", passwd:"")
            print("Connected Good :D")
            
            try con.use(db_name)
            //let select_query = try con.prepare("SELECT * FROM User")
            let table = MySQL.Table(tableName: "User", connection: con);
          
          
            if var rows = try table.select(["name"], Where: ["password=SHA1(",pswTxtField.text!,") AND name=",usrTxtField.text!]){
                if rows.isEmpty {
                    let alert = UIAlertController(title: "Error", message: "Invanid Username/Password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    print("Invalid Username/Password")
                }
 
                else{
                    /*
                    let  select_stmt = try con.prepare("SELECT name from User where name=?")
                    try select_stmt.exec([usrTxtField.text!])
                    let res = try select_stmt.query([1])
                    let result = try res.readRow();
                    print(result)
                  */
                    let username = usrTxtField.text!
                    let alert = UIAlertController(title: "Welcome", message: "Bienvenido al sistema \(username)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    print(rows)
               
                  
                    
                  
                    
                    
                  
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

