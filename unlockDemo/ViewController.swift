//
//  ViewController.swift
//  unlockDemo
//
//  Created by TANG,QI-RONG on 2020/8/20.
//  Copyright © 2020 Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var passwordImage1: UIImageView!
    
    @IBOutlet weak var passwordImage2: UIImageView!
    
    @IBOutlet weak var passwordImage3: UIImageView!
    
    @IBOutlet weak var passwordImage4: UIImageView!
    
    //大圖
    @IBOutlet weak var someImageView: UIImageView!
    
    let peterPassword = "0207"
    var passwordNumber = ""
    let emptyImage = UIImage(named: "emptyImage")
   
    
 //MARK: - func
    

    //出圖順序
    func passwordImage() {
        let passcodeCount = passwordNumber.count
        
        switch passcodeCount{
        case 1:
            passwordImage1.image = UIImage(named: "Apple1")
            passwordImage2.image = emptyImage
            passwordImage3.image = emptyImage
            passwordImage4.image = emptyImage
            
        case 2:
            passwordImage1.image = UIImage(named: "Apple1")
            passwordImage2.image = UIImage(named: "Apple2")
            passwordImage3.image = emptyImage
            passwordImage4.image = emptyImage
            
        case 3:
            passwordImage1.image = UIImage(named: "Apple1")
            passwordImage2.image = UIImage(named: "Apple2")
            passwordImage3.image = UIImage(named: "Apple3")
            passwordImage4.image = emptyImage
          
        case 4:
            passwordImage1.image = UIImage(named: "Apple1")
            passwordImage2.image = UIImage(named: "Apple2")
            passwordImage3.image = UIImage(named: "Apple3")
            passwordImage4.image = UIImage(named: "Apple4")
            
        default:
            passwordImage1.image = emptyImage
            passwordImage2.image = emptyImage
            passwordImage3.image = emptyImage
            passwordImage4.image = emptyImage
        }
        
    }
    
    func keyInPassword(keyIn: String){
        if 0...3 ~= passwordNumber.count{
            passwordNumber += keyIn
        }
        
        if passwordNumber.count == 4 {
            if passwordNumber == peterPassword{
                someImageView.image = UIImage(named: "JobsThinking")
            }else{
                someImageView.image = UIImage(named: "peterBirthday")
                errorMessage()
            }
        }
       passwordImage()
    }
    
    
    func errorMessage(){
        if passwordNumber != "0207" {
            let Alert = UIAlertController(title: "密碼錯誤", message: "密碼:0207", preferredStyle: .alert)
            let Action = UIAlertAction(title: "我會記住", style: .default, handler: nil)
            Alert.addAction(Action)
            present(Alert, animated: true, completion: restart)
        }
    }
    
    func restart(){
        passwordNumber = ""
        clearNumber()
        passwordImage()
    }
    
    func clearNumber(){
           passwordImage1.image = emptyImage
           passwordImage2.image = emptyImage
           passwordImage3.image = emptyImage
           passwordImage4.image = emptyImage
       }


//MARK: - Button
    
      @IBAction func numberBtn(_ sender: UIButton){
        keyInPassword(keyIn: String(sender.tag))
          
      }
      
      @IBAction func reloadBtn(_ sender: UIButton){
        restart()
        someImageView.image = UIImage(named: "birthday")
      }
      
      @IBAction func deleteBtn(_ sender: UIButton){
        if 1...3 ~= passwordNumber.count {
            passwordNumber.removeLast()
        }
        passwordImage()
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordImage()
        // Do any additional setup after loading the view.
    }


}

