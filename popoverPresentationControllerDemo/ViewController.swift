//
//  ViewController.swift
//  popoverPresentationControllerDemo
//
//  Created by liaolj on 16/11/25.
//  Copyright © 2016年 liaolj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var colorBox:UIView!
    @IBOutlet weak var imageButton:UIButton!
    @IBOutlet weak var colorButton:UIButton!
}

//MARK: lifeCircle
extension ViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tvModel = TableViewModel(target: tableView, vc: self)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

//MARK: segue

extension ViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let popVC = segue.destinationViewController as! PopViewTableViewController
        popVC.popoverPresentationController?.delegate = self
        if let identifier = segue.identifier {
            popVC.identifier = identifier
            popVC.parent = self
            switch identifier {
            case "image":
                popVC.popoverPresentationController?.sourceRect = imageButton.bounds
            default: //color
                popVC.popoverPresentationController?.sourceRect = colorButton.bounds
            }
        }

    }
}

extension ViewController:UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}

extension ViewController {
    func changeImage(index:Int) {
        switch index {
        case 0:
            imageView.image = UIImage(named: "one")
        case 1:
            imageView.image = UIImage(named: "two")
        default:
            imageView.image = UIImage(named: "three")
        }
    }
    func changeColor(index:Int) {
        let colors = [
            UIColor(red: 114/255, green: 116/255, blue: 91/255, alpha: 1.0),
            UIColor(red: 152/255, green: 191/255, blue: 0/255, alpha: 1.0),
            UIColor(red: 133/255, green: 61/255, blue: 174/255, alpha: 1.0)
        ]
        colorBox.backgroundColor = colors[index]
    }
}
