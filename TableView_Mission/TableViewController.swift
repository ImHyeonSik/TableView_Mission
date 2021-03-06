//
//  TableViewController.swift
//  TableView_Mission
//
//  Created by hyeonsik on 2022/05/05.
//

import UIKit

var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itmesImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // edit 버튼을 만들어서 삭제하는 기능
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() // 테이블 뷰를 다시 불러옴
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀의 데이터를 넣어 뷰를 보여지는 함수
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

//        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
//
////        cell.imageView?.image = UIImage(named: itmesImageFile[(indexPath as NSIndexPath).row])
//        print((indexPath as NSIndexPath).row);
//        cell.imageView?.image = UIImage(named: itmesImageFile[(indexPath as NSIndexPath).row])
        
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        print((indexPath as NSIndexPath).row)
        cell.imageView?.image = UIImage(named: itmesImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itmesImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        // 삭제 버튼 글씨 바꿈
        return "삭제"
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 목록 순서 바꾸는 기능
        let itemToMove = items[(fromIndexPath as NSIndexPath).row] // 이동할 아이템의 위치를 저장
        let itemImageToMove = itmesImageFile[(fromIndexPath as NSIndexPath).row]
        items.remove(at: (fromIndexPath as NSIndexPath).row) // 이동할 아이템을 삭제 후 이떄 삭제한 아이템 뒤의 아이템들의 인덱스 재정렬
        itmesImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        items.insert(itemToMove, at: (to as NSIndexPath).row) // 삭제된 아이템을 이동할 위치로 삽입 후 뒤의 아이템들의 인덱스 재정렬
        itmesImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그웨이를 이용하여 뷰를 이동하는 함수
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[(indexPath! as NSIndexPath).row])
        }
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
