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
    shimmeringView.shimmeringColorArray = [UIColor.white]
    shimmeringView.shimmeringTextColor = UIColor.blue
    shimmeringView.shimmeringRotationAngle = 20.0
    shimmeringView.shimmeringLength = 200
    view.addSubview(shimmeringView)
    
    let contentLabel = UILabel(frame: shimmeringView.bounds)
    contentLabel.font = UIFont.systemFont(ofSize: 30)
    contentLabel.text = "hello world"
    shimmeringView.setContentView(contentLabel)
    shimmeringView.isShimmering = true
    
    let shimmeringView2 = MQShimmeringView(frame: CGRect(x: 100, y: 250, width: 200, height: 50))
    shimmeringView2.shimmeringColorArray = [UIColor.yellow,
                                            UIColor.white,
                                            UIColor.green]
    shimmeringView2.shimmeringTextColor = UIColor.red
    shimmeringView2.shimmeringRotationAngle = 30.0
    view.addSubview(shimmeringView2)
    
    let contentLabel2 = UILabel(frame: shimmeringView2.bounds)
    contentLabel2.font = UIFont.systemFont(ofSize: 30)
    contentLabel2.text = "hello world"
    shimmeringView2.setContentView(contentLabel2)
    shimmeringView2.isShimmering = true
    
    let shimmeringView3 = MQShimmeringView(frame: CGRect(x: 100, y: 350, width: 200, height: 50))
    shimmeringView3.shimmeringImage = UIImage(named: "userAvatar.jpg")
    shimmeringView3.shimmeringTextColor = UIColor.orange
    view.addSubview(shimmeringView3)
    
    let contentLabel3 = UILabel(frame: shimmeringView3.bounds)
    contentLabel3.font = UIFont.systemFont(ofSize: 30)
    contentLabel3.text = "hello world"
    shimmeringView3.setContentView(contentLabel3)
    shimmeringView3.isShimmering = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

