//
//  ViewController.swift
//  NuGuNa
//
//  Created by 시모니 on 1/24/24.
//

import UIKit

class FirstVC : UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var creatIDBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print("앱시작")
       
      
    }

   private func configure() {
        loginBtn.layer.cornerRadius = 10
        creatIDBtn.layer.cornerRadius = 10
        creatIDBtn.layer.borderColor = UIColor(red: 25/255.0, green: 100/255.0, blue: 80/255.0, alpha: 1.0).cgColor
        creatIDBtn.layer.borderWidth = 1.0
    }
    
    

    @IBAction func tapCreatIDBtn(_ sender: UIButton) {
        let creatInputUserNameVC = CreatInputUserNameVC()
        
        // 애니메이션 없이 BViewController로 전환
        self.present(creatInputUserNameVC, animated: false, completion: nil)
    }
    
    
    
}


