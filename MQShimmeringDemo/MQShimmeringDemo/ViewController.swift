//
//  ViewController.swift
//  MQShimmeringDemo
//
//  Created by mq on 2017/8/2.
//  Copyright © 2017年 MQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.black
    
    let shimmeringView = MQShimmeringView(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
    shimmeringView.shimmeringColorArray = [UIColor.white.withAlphaComponent(0.1), UIColor.white.withAlphaComponent(1), UIColor.white.withAlphaComponent(0.1)]
    shimmeringView.shimmeringTextColor = UIColor.blue
    shimmeringView.shimmeringRotationAngle = 20.0
    shimmeringView.shimmeringLength = 200
    view.addSubview(shimmeringView)
    
    let maskLabel = UILabel(frame: shimmeringView.bounds)
    maskLabel.font = UIFont.systemFont(ofSize: 30)
    maskLabel.text = "hello world"
    shimmeringView.setContentView(maskLabel)
    shimmeringView.isShimmering = true
    
    let shimmeringView2 = MQShimmeringView(frame: CGRect(x: 100, y: 250, width: 200, height: 50))
    shimmeringView2.shimmeringColorArray = [UIColor.yellow, UIColor.white, UIColor.green]
    shimmeringView2.shimmeringTextColor = UIColor.red
    shimmeringView2.shimmeringRotationAngle = 30.0
    view.addSubview(shimmeringView2)
    
    let maskLabel2 = UILabel(frame: shimmeringView2.bounds)
    maskLabel2.font = UIFont.systemFont(ofSize: 30)
    maskLabel2.text = "hello world"
    shimmeringView2.setContentView(maskLabel2)
    shimmeringView2.isShimmering = true
    
    let shimmeringView3 = MQShimmeringView(frame: CGRect(x: 100, y: 350, width: 200, height: 50))
    shimmeringView3.shimmeringImage = UIImage(named: "userAvatar.jpg")
    shimmeringView3.shimmeringTextColor = UIColor.orange
    view.addSubview(shimmeringView3)
    
    let maskLabel3 = UILabel(frame: shimmeringView3.bounds)
    maskLabel3.font = UIFont.systemFont(ofSize: 30)
    maskLabel3.text = "hello world"
    shimmeringView3.setContentView(maskLabel3)
    shimmeringView3.isShimmering = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

