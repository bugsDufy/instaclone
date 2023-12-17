//
//  RegisterViewModel.swift
//  instgaramCloneFurkanSabaz
//
//  Created by Murat Gules on 16.12.2023.
//


import FirebaseAuth
import UIKit

class RegisterViewModel {
    
    var username = ""
    var email = ""
    var password = ""
    var errorMessage = ""
    
    
    
    init(){}
    
    
    func register(){
        guard validate() else {
            print("yok bole bi kullanim sekli")
            return
        }
        //MARK: firebase islemleri
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] Result, hata in
            
            guard let self = self else { return }
            
            if let hata = hata {
                print("Kullanici olusmadi")
                return
            }
            guard let userId = Result?.user.uid else {
                return
            }
            print("Olusan Kullanici id: ", userId)
            
            self.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        //firebase storege
        
    }
    
    func fotografSecmeEkrani(){
        // burada kaldim gelince buradan devam et firebase de sikinti cikti onu da bir ara halletmen lazim
        // fotograf secme icin
        //bunu burada kullanmak sikinti gibi gelince bir bak
        
        
        
        
        
    }
    
    fileprivate func validate()-> Bool {
        errorMessage = ""
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lutfen tum alanlari doldurunuz"
            print(errorMessage)
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Gecerli bir mail adresi giriniz"
            print(errorMessage)
            return false
        }
        guard password.count >= 8 else {
            errorMessage = "Sifreniz en az 8 kakrakterli olamalidir"
            print(errorMessage)
            return false
        }
        return true
    }
}

