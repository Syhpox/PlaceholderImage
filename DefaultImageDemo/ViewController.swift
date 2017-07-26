//
//  ViewController.swift
//  DefaultImageDemo
//
//  Created by WZH on 2017/7/20.
//  Copyright © 2017年 Zhihua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let img = UIImageView.init()
        let rect = CGRect(x: 30, y: 100, width: 300, height: 300)
        img.frame = rect
        img.image = UIImage.fc_placeholder(rect.size)
        self.view.addSubview(img)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

