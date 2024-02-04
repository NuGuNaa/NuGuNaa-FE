//
//  ApplyPopUpVC.swift
//  NuGuNa
//
//  Created by 시모니 on 1/25/24.
//

import UIKit

class ApplyPopUpVC: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
   private func configure() {
        popUpView.layer.cornerRadius = 10
        okBtn.layer.cornerRadius = 10
        cancelBtn.layer.cornerRadius = 10
        cancelBtn.layer.borderColor = UIColor(red: 25/255.0, green: 100/255.0, blue: 80/255.0, alpha: 1.0).cgColor
        cancelBtn.layer.borderWidth = 1.0
    }
    
    @IBAction func tapCancelBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapOkBtn(_ sender: UIButton) {
        //세그먼트에 따라서 프린팅시키고 뷰 사라지게하기
        let selectedIndex = segment.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            print("찬성측 신청") // 찬성측으로 유저정보 보내면됨
            let alert = UIAlertController(title: "찬성측으로 신청되었습니다.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "확인", style: .default) { action in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okBtn)
            present(alert, animated: true)
        case 1:
            print("반대측 신청") // 반대측으로 유저정보 보내면됨
            let alert = UIAlertController(title: "반대측으로 신청되었습니다.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "확인", style: .default) { action in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okBtn)
            present(alert, animated: true)
        default:
            break
        }
    }
    
}







