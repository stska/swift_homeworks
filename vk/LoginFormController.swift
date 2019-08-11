//
//  LoginFormController.swift
//  vk
//
//  Created by user155176 on 07/08/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

        @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var labelStartName: UILabel!
        @IBOutlet weak var uiLogin: UITextField!
        @IBOutlet weak var uiPass: UITextField!
        @IBOutlet weak var uiButtonSignIn: UIButton!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Жест нажатия
            let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            // Присваиваем его UIScrollVIew
            scrollView?.addGestureRecognizer(hideKeyboardGesture)
            //-------------------------------------------------?????????????????
            self.scrollView?.contentInsetAdjustmentBehavior = .automatic
        }
        
        // when the button is pressed
        @IBAction func logButton(_ sender: UIButton) {
         
            sender.setTitleColor(.darkGray, for: .normal)
            
        }
        
        @objc func keyboardWasShown(notification: Notification) {
            print(notification)
            // Получаем размер клавиатуры
            let info = notification.userInfo! as NSDictionary
            print(info)
            //test----------------------------
            let test = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            print(test)
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            print(kbSize)
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            print(contentInsets)
            // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
            
            //---------------------------------------------------------
            self.scrollView?.contentInset = contentInsets
            //scrollView?.scrollIndicatorInsets = contentInsets  ZADAT' VOPROS
        }
        
        //Когда клавиатура исчезает
        @objc func keyboardWillBeHidden(notification: Notification) {
            // Устанавливаем отступ внизу UIScrollView, равный 0
            let contentInsets = UIEdgeInsets.zero
            //--------------------------------------------
            
            scrollView?.contentInset = contentInsets
            // scrollView?.scrollIndicatorInsets = contentInsets   ZADAT VOPROOS???????????????
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
    //---------------------Add check login and pw plus a point to transfer to a new controller-------------
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        

    func checkUserData()-> Bool {
            
            guard let login = uiLogin.text, let password = uiPass.text else{
                return false
            }
            
            if login == "admin" && password == "0000"{
                return true
            } else {
                return false
            }
        }
           let checkResult = checkUserData()
        
        func showLoginError() {
            let alter = UIAlertController(title: "Error", message: "Wrong Loging or password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alter.addAction(action)
            present(alter, animated: true, completion: nil)
            
        }
        
        if !checkResult {
            showLoginError()
            return false
        } else {
            return checkResult
        }
        
}
}  
      
        



