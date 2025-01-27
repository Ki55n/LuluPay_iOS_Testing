//
//  RequestAuthorizationViewController.swift
//  Sample
//
//  Created by Swathiga on 24/01/25.
//

import UIKit

class RequestAuthorizationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NumberPadCellDelegate {
    func didTapNumber(_ number: String) {
        // Get the current cell (PinEntryCell)
        if let pinCell = tblList.cellForRow(at: IndexPath(row: 1, section: 0)) as? PinEntryCell {
            // Check if there's space to add the number
            if pinCell.pin.filter({ $0.isEmpty }).count > 0 {
                // Find the first empty spot in the pin array
                if let index = pinCell.pin.firstIndex(of: "") {
                    pinCell.pin[index] = number
                }
            }
            if pinCell.pin.count == 4 && !pinCell.pin.contains("") && !pinCell.pin.isEmpty {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RequestSuccessViewController") as! RequestSuccessViewController
                navigationController?.pushViewController(vc, animated: true)

            }
        }
    }

    func didTapBackspace() {
        // Get the current cell (PinEntryCell)
        if let pinCell = tblList.cellForRow(at: IndexPath(row: 1, section: 0)) as? PinEntryCell {
            // Find the last non-empty pin and remove it
            if let index = pinCell.pin.lastIndex(where: { !$0.isEmpty }) {
                pinCell.pin[index] = ""
            }
        }
    }

    @IBOutlet weak var tblList: UITableView!
    
    
    var arrList = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register header view
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: nil)
        tblList.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")

        let TitlecellNib = UINib(nibName: "TitleCell", bundle: nil)
        tblList.register(TitlecellNib, forCellReuseIdentifier: "cellTitle")
      
        tblList.register(UINib(nibName: "NumberPadCell", bundle: nil), forCellReuseIdentifier: "NumberPadCell")
        
        tblList.register(UINib(nibName: "PinEntryCell", bundle: nil), forCellReuseIdentifier: "cellPin")
        tblList.register(UINib(nibName: "ButtonCell", bundle: nil), forCellReuseIdentifier: "cellbutton")

        if let headerView = Bundle.main.loadNibNamed("CustomHeaderView", owner: self, options: nil)?.first as? CustomHeaderView {
            headerView.lblTitle.text = "Request a new card" // Customize the header text
            headerView.btnBack.addTarget(self, action: #selector(self.moveBack), for: .touchUpInside)
            headerView.frame = CGRect(x: 0, y: 0, width: tblList.frame.width, height: 150)

            tblList.tableHeaderView = headerView

            let backgroundView = UIView()
            backgroundView.frame = CGRect(x: 0, y: headerView.frame.maxY, width: tblList.frame.width, height: 160)
            backgroundView.backgroundColor = UIColor(named: "customCyanColor") // Set your desired background color here
            view.addSubview(backgroundView)
            view.bringSubviewToFront(tblList)

        }
        
        tblList.bounces = false
        // Add the custom background view to the table view
        tblList.backgroundColor = .clear
        tblList.delegate = self
        tblList.dataSource = self
        tblList.clipsToBounds = false

        
    }
    
    @objc func moveBack(){
        self.navigationController?.popViewController(animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if indexPath.row == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTitle", for: indexPath) as? TitleCell else {
                    return UITableViewCell()
                }
                cell.lblTitle.text = "Enter your PIN"
                cell.lblTitle.textAlignment = .center
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPin", for: indexPath) as? PinEntryCell else {
                    return UITableViewCell()
                }
                
                return cell

            }
        }else{
            if indexPath.row == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "NumberPadCell", for: indexPath) as? NumberPadCell else {
                    return UITableViewCell()
                }
                cell.delegate = self
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellbutton", for: indexPath) as? ButtonCell else {
                    return UITableViewCell()
                }
                cell.btnTitle.setTitle("Forgot PIN?", for: .normal)
                cell.btnTitle.setTitleColor(UIColor(named: "forgotPin"), for: .normal)
                cell.btnTitle.backgroundColor = UIColor.white
                cell.btnTitle.addTarget(self, action: #selector(moveToForgotPin), for: .touchUpInside)
                return cell

            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    @objc func moveToForgotPin(){
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RequestSuccessViewController") as! RequestSuccessViewController
//        navigationController?.pushViewController(vc, animated: true)

    }

}
