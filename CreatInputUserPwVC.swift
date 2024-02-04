//
//  CreatUserPwVC.swift
//  NuGuNa
//
//  Created by 시모니 on 1/24/24.
//

import UIKit
import Alamofire


class CreatInputUserPwVC: UIViewController {
    
    @IBOutlet weak var firstPwTextField: UITextField!
    @IBOutlet weak var secondPwTextField: UITextField!
    @IBOutlet weak var creatBtn: UIButton!
    
    var creatInputUserPwVM: CreatInputUserPwVM!
    var creatInputUserEmailVM: CreatInputUserEmailVM!
    var creatInputUserNameVM: CreatInputUserNameVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatInputUserPwVM = CreatInputUserPwVM()
        creatBtn.layer.cornerRadius = 10
        secondPwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - textField Add Target
    @objc func textFieldDidChange(_ sender: Any?) {
        creatBtn.isHidden =  !(secondPwTextField.text?.isEmpty == false)
    }
    
    //MARK: - @IBAction
    @IBAction func tapCreatBtn(_ sender: UIButton) {
        let failAlert = UIAlertController(title: "비밀번호가 동일하지 않습니다", message: nil, preferredStyle: .alert)
        let successAlert = UIAlertController(title: "회원가입 되었습니다", message: nil, preferredStyle: .alert)
        let retry = UIAlertAction(title: "다시작성하기", style: .default, handler: nil)
        let okBtn = UIAlertAction(title: "확인", style: .default)
        
        if firstPwTextField.text == secondPwTextField.text {
            
            guard let firstPwTextField = firstPwTextField.text else { return }
            guard let secondPwTextField = secondPwTextField.text else { return }
            creatInputUserPwVM.pw1 = firstPwTextField
            creatInputUserPwVM.pw2 = secondPwTextField
            
                   let parameters: [String: Any] = [
                       "email": "\(creatInputUserEmailVM.email)",
                       "user_name": "\(creatInputUserNameVM.name)",
                       "password": "\(creatInputUserPwVM.pw1)"
                   ]
              
            AF.request(creatInputUserPwVM.signUpURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
                                .validate() // 선택 사항: 응답을 유효성 검사할 수 있음
                                .responseJSON { response in
                                    switch response.result {
                                    case .success(let value):
                                        print("요청 성공: \(value)")
                                    case .failure(let error):
                                        print("요청 실패: \(error)")
                                    }
                            }
            
            if let navigationController = self.navigationController {
                navigationController.popToRootViewController(animated: true)
            }
            successAlert.addAction(okBtn)
            present(successAlert, animated: true, completion: nil)
        } else {
            failAlert.addAction(retry)
            present(failAlert, animated: true, completion: nil)
        }
    }
    
}


/*
 구현해야할것
 [ v ] 키보드 크기만큼 버튼 위치 변경 >> 뷰가 텅텅 비어있으니 애초에 버튼위치를 위로 옮겨놨음
 [ v ] 텍스트필드 두번째 비밀번호가 작성되기 전에는 버튼 히든
 [ v ] 텍스트필드 두개가 비밀번호가 일치하지 않을경우 알럿창 띄우기
 [ v ] 가입버튼을 누르면 알럿띄우기(알럿내용: 회원가입되었다.) 확인버튼 = 첫화면으로 이동, 네비게이션 스택을 모두 비우고 root view controller로 이동
 */
