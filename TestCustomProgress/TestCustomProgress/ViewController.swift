//
//  ViewController.swift
//  TestCustomProgress
//
//  Created by iOS on 2018/2/1.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var progress = CDProgress()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //设置view
    @objc func setupView(){
        
        progress.frame = CGRect(x: 10, y: 100, width: 300, height: 50)
        view.addSubview(progress)
        
        //属性的一些设置
        progress.set(progressColor: .orange)
        progress.set(cornerRadius: 25)
    }

    //从左到右开始进度
    @IBAction func startPlay(_ sender: UIButton) {
        
         progress.set(current: 55, total: 100)
//        for i in 0...100 {
//            let value:CGFloat = CGFloat(i/100)
//            progress.setProgress(value: value)
//        }
    }
    
    //重置
    @IBAction func reSet(_ sender: UIButton) {
        progress.set(current: 0, total: 0)
    }
    
}

