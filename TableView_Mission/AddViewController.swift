//
//  AddViewController.swift
//  TableView_Mission
//
//  Created by hyeonsik on 2022/05/05.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itmesImageFile.append("clock.png")
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true) // 루트 뷰 컨트롤러 -> 테이블 뷰로 돌아감
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
