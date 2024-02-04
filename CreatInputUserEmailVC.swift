//
//  CreatInputUserEmailVC.swift
//  NuGuNa
//
//  Created by 시모니 on 1/24/24.
//

import UIKit

class CreatInputUserEmailVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    var creatInputUserEmailVM: CreatInputUserEmailVM!
    var creatInputUserNameVM: CreatInputUserNameVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatInputUserEmailVM = CreatInputUserEmailVM()
        continueBtn.layer.cornerRadius = 10
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //MARK: - textField Add Target
    @objc func textFieldDidChange(_ sender: Any?) {
        continueBtn.isHidden =  !(emailTextField.text?.isEmpty == false)
    }
    
    //MARK: - @IBAction
    @IBAction func tapcontinueBtn(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        creatInputUserEmailVM.email = email
        
        guard let creatInputUserPwVC = storyboard?.instantiateViewController(identifier: "CreatInputUserPwVC") as? CreatInputUserPwVC else { return }
        creatInputUserPwVC.creatInputUserNameVM = self.creatInputUserNameVM
        creatInputUserPwVC.creatInputUserEmailVM = self.creatInputUserEmailVM
        
        navigationController?.pushViewController(creatInputUserPwVC, animated: true)
    }
    
}





/*
 CreatInputUserEmailVC
 [ v ] 키보드 크기만큼 버튼 위치 변경 >> 뷰가 텅텅 비어있으니 애초에 버튼위치를 위로 옮겨놨음
 [ v ] 텍스트필드에 이메일이 작성되기 전에는 버튼 히든
 */
