//
//  ViewController.swift
//  drawPath
//
//  Created by Yifang Zhang on 10/2/16.
//  Copyright © 2016 Yifang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func drawButton(sender: AnyObject) {
        
        let myView = ShapeView(frame: CGRectMake(50, 200, 280, 250), shape: Int(0))
        myView.backgroundColor = UIColor.cyanColor()
        view.addSubview(myView)
        
    }


}

