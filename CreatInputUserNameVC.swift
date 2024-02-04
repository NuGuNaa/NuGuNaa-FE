//
//  CreatInputUserName.swift
//  NuGuNa
//
//  Created by 시모니 on 1/24/24.
//

import UIKit

class CreatInputUserNameVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    var creatInputUserNameVM: CreatInputUserNameVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatInputUserNameVM = CreatInputUserNameVM()
        continueBtn.layer.cornerRadius = 10
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - textField Add Target
    @objc func textFieldDidChange(_ sender: Any?) {
        continueBtn.isHidden =  !(nameTextField.text?.isEmpty == false)
    }
    
    //MARK: - @IBAction
    @IBAction func tapcontinueBtn(_ sender: UIButton) {
        guard let name = nameTextField.text else {return}
        creatInputUserNameVM.name = name
        
        guard let creatInputUserEmailVC = storyboard?.instantiateViewController(withIdentifier: "CreatInputUserEmailVC") as? CreatInputUserEmailVC else { return }
        creatInputUserEmailVC.creatInputUserNameVM = self.creatInputUserNameVM
        navigationController?.pushViewController(creatInputUserEmailVC, animated: true)
    }
    
}


/*
 CreatInputUserNameVC
 
 [ v ] 키보드 크기만큼 버튼 위치 변경 >> 뷰가 텅텅 비어있으니 애초에 버튼위치를 위로 옮겨놨음
 [ v ] 텍스트필드에 이름이 작성되기 전에는 버튼 히든
 
 */
