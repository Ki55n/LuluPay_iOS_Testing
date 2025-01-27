//
//  TransferMoneyViewController.swift
//  Sample
//
//  Created by Swathiga on 27/01/25.
//

import UIKit

class TransferMoneyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RequestMoneyCell", bundle: nil), forCellReuseIdentifier: "cellReq")

        if let headerView = Bundle.main.loadNibNamed("CustomHeaderView", owner: self, options: nil)?.first as? CustomHeaderView {
            headerView.lblTitle.text = "Transfer Money" // Customize the header text
            headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 150)
            headerView.btnBack.addTarget(self, action: #selector(self.moveBack), for: .touchUpInside)
            tableView.tableHeaderView = headerView

            let backgroundView = UIView()
            backgroundView.frame = CGRect(x: 0, y: headerView.frame.maxY, width: tableView.frame.width, height: tableView.frame.height/5)
            backgroundView.backgroundColor = UIColor(named: "customCyanColor") // Set your desired background color here
            view.addSubview(backgroundView)
            view.bringSubviewToFront(tableView)

        }
        
        
       
        
        
        tableView.bounces = false
        // Add the custom background view to the table view
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.clipsToBounds = false

    }
    @objc func moveBack(){
        self.navigationController?.popViewController(animated: true)
    }


    

}
extension TransferMoneyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Header, Card, Exchange Rates
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return 1 // Header and Card have one cell each
       
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.section {
//        case 0: // Header Section
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellReq", for: indexPath) as? RequestMoneyCell else {
                fatalError("Unable to dequeue HeaderViewCell with identifier 'cellHeader'")
            }
            cell.lblTitle.text = "Send Money"
//            cell.profileImageView.backgroundColor = .red
            return cell
            
        // Uncomment this section if you decide to use the CardBalanceCell
    //    case 1: // Card Balance Section
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCardBalance", for: indexPath) as! CardBalanceCell
    //        cell.accountBalanceLabel.text = "Account Balance"
    //        cell.balanceValueLabel.text = "****"
    //        cell.cardLogoImageView.image = UIImage(named: "cardLogo")
    //        return cell
            
//        case 1:
//            // Exchange Rates Section
//            let cell = tableView.dequeueReusableCell(withIdentifier: "rateExchange", for: indexPath) as! ExchangeRateCell
//            let rate = exchangeRates[indexPath.row]
//            
//            // Show header only for the first row
//            cell.viewHeader.isHidden = indexPath.row != 0
//            cell.flagImageView.image = UIImage(named: rate.flag)
//            cell.currencyLabel.text = rate.currency
//            cell.buyRateLabel.text = rate.buy
//            cell.sellRateLabel.text = rate.sell
//            return cell
//            
//        case 2:
//            // Exchange Rates Section
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTransfer", for: indexPath) as! TransferCell
//            // Add Tap Gesture Recognizer to `viewTransfer`
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleViewTransferTap(_:)))
//            cell.viewTransfer.isUserInteractionEnabled = true
//            cell.viewTransfer.addGestureRecognizer(tapGesture)
//
//            
//            return cell
//
//        default:
//            return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }

}
