//
//  ViewController.swift
//  instgaramCloneFurkanSabaz
//
//  Created by Murat Gules on 15.12.2023.
//
import FirebaseAuth
import UIKit


class RegisterViewController: UIViewController {
   
    var viewModel = RegisterViewModel()

    var vm = MyImagePickerController(viewController: UIViewController())
    
    let btnFotografEkle: UIButton = {
        let btn = UIButton(type: .system)
        //        btn.backgroundColor = .yellow
        btn.setImage(UIImage(imageLiteralResourceName: "Fotograf_Sec").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(btnFotografEklePressed), for: .touchUpInside)
        return btn
    }()
    
    @objc func btnFotografEklePressed(){
        print("Fotograf secme zamani")
        
//        let imagePicker = UIImagePickerController()
//        present(imagePicker, animated: true, completion: nil)
        vm.showImagePicker()
    }
    
    let txtName: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Full Name..."
        // otomatik duzeltmeyi iptal
        txt.autocapitalizationType = .none

        txt.backgroundColor = UIColor(white: 0, alpha: 0.05)
//        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.borderStyle = .roundedRect
        return txt
    }()
    
    let txtEmail: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Email Address..."
        // otomatik duzeltmeyi iptal
        txt.autocapitalizationType = .none
        txt.backgroundColor = UIColor(white: 0, alpha: 0.05)
//        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.borderStyle = .roundedRect
        return txt
    }()
    
    let txtPassword: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password..."
        // otomatik duzeltmeyi iptal
        txt.autocapitalizationType = .none
        txt.backgroundColor = UIColor(white: 0, alpha: 0.05)
//        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont.systemFont(ofSize: 16)
        // yildiz yapma
        txt.isSecureTextEntry = true
        txt.borderStyle = .roundedRect
        return txt
    }()
    
    let btnKayitOl: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
//        btn.backgroundColor = UIColor(red: 150/255, green: 205/255, blue: 245/255, alpha: 1)
        btn.backgroundColor = UIColor.rgbDonustur(red: 150, green: 205, blue: 245)
        btn.layer.cornerRadius = 6
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(btnKayitolPressed), for: .touchUpInside)
        return btn
    }()
    
    
    
    @objc  func btnKayitolPressed(){
        
        print("tiklandi")

        viewModel.username = txtName.text ?? ""
        viewModel.email = txtEmail.text ?? ""
        viewModel.password = txtPassword.text ?? ""
        viewModel.register()
        
        self.txtName.text = ""
        self.txtEmail.text = ""
        self.txtPassword.text = ""
  
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // gorunum ekleme
        // view'in icerisine btnFotografEkle butonunu ekledik
        view.addSubview(btnFotografEkle)
//        view.addSubview(txtEmail)
        // belirli bir yere konumlandirma
        //        btnFotografEkle.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        //        //buton ekranin merkezine konumlandirilacak
        //        // ama yatayda sikintili oluyor
        //        btnFotografEkle.center = view.center
        
        // isActive degerini true yaparak belirtilen kisitin uygulanmasini sagladik
        
//        btnFotografEkle.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        btnFotografEkle.heightAnchor.constraint(equalToConstant: 150).isActive = true
        btnFotografEkle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        btnFotografEkle.safeAreaLayoutGuide.topAnchor.constraint(equalTo:             view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        
        btnFotografEkle.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 150, height: 150)
        // asagidaki de olabilir ama ben safeAreaLayoutGuide olanini tercih ettim
        //        btnFotografEkle.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        
        // TEK TEK EL ILE GIRMEKTENSE NSLayoutConstraint.activate BIR DIZI BEKLIYOR
        // BUNU ASAGIDAKI GIBI KULLANMAK DAHA MANTIKLI
        // ILERIDE GORECEKSIN KENDI FONKSIYONUMUZU YAZACAGIZ O DAHA DA MANTIKLI
        
        
//        txtEmail.topAnchor.constraint(equalTo: btnFotografEkle.bottomAnchor, constant: 20).isActive = true
//        txtEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
//        txtEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
//        txtEmail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        girisAlanlariniOlustur()
        
    }

    fileprivate func girisAlanlariniOlustur(){
        
//        let kirmiziView = UIView()
//        kirmiziView.backgroundColor = .systemRed
        
//        let sariView = UIView()
//        sariView.backgroundColor = .systemYellow
//        
//        let maviView = UIView()
//        maviView.backgroundColor = .systemBlue
        
        let stackView = UIStackView(arrangedSubviews: [txtName, txtEmail, txtPassword, btnKayitOl])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        
        // buna gerek kalmadi kendi anchor metodumu yazdim!!!!!!!!!!!!!!!!!!!!!!!!
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: btnFotografEkle.bottomAnchor, constant: 20),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
//            stackView.heightAnchor.constraint(equalToConstant: 230)
//        ])
        
        stackView.anchor(top: btnFotografEkle.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 45, paddingRight: -45, width: 0, height: 230)
    }
    
    
}
    



