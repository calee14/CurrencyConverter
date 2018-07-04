//
//  ViewController.swift
//  ConvertCurrency
//
//  Created by Cappillen on 7/4/18.
//  Copyright © 2018 Cappillen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usContainer: UIView!
    @IBOutlet weak var canadaContainer: UIView!
    
    @IBOutlet weak var firstCurrencyCard: UIStackView!
    @IBOutlet weak var firstCurrencyImage: UIImageView!
    @IBOutlet weak var firstCurrencyTitle: UILabel!
    @IBOutlet weak var firstCurrencyAmount: BillAmountTextField!
    
    @IBOutlet weak var secondCurrencyCard: UIStackView!
    @IBOutlet weak var secondCurrencyImage: UIImageView!
    @IBOutlet weak var secondCurrencyTitle: UILabel!
    @IBOutlet weak var secondCurrencyAmount: BillAmountTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstCurrencyAmount.calculateButtonAction = {
            if self.firstCurrencyAmount.isFirstResponder {
                self.firstCurrencyAmount.resignFirstResponder()
            }
            guard let billAmountText = self.firstCurrencyAmount.text,
                let billAmount = Double(billAmountText) else {
                    return
            }
            self.secondCurrencyAmount.text = String(billAmount * 1.31)
        }
        secondCurrencyAmount.calculateButtonAction = {
            if self.secondCurrencyAmount.isFirstResponder {
                self.secondCurrencyAmount.resignFirstResponder()
            }
            guard let billAmountText = self.secondCurrencyAmount.text,
                let billAmount = Double(billAmountText) else {
                    return
            }
            self.firstCurrencyAmount.text = String(billAmount / 1.31)
        }
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        let bottomBorderView = UIView(frame: CGRect(x: 0, y: self.usContainer.frame.size.height,
                                                 width: self.usContainer.frame.size.width,
                                                 height: 1))
        bottomBorderView.backgroundColor = UIColor.gray
        self.usContainer.addSubview(bottomBorderView)
        let bottomBorderView_2 = UIView(frame: CGRect(x: 0, y: self.canadaContainer.frame.size.height,
                                                    width: self.canadaContainer.frame.size.width,
                                                    height: 1))
        bottomBorderView_2.backgroundColor = UIColor.gray
        self.canadaContainer.addSubview(bottomBorderView_2)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

