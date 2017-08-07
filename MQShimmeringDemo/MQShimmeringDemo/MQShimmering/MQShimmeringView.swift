//
//  MQShimmeringView.swift
//  UIPackage
//
//  Created by mq on 2017/7/26.
//  Copyright © 2017年 MQ. All rights reserved.
//

import UIKit

class MQShimmeringView: UIView, MQShimmering {
  
  var isShimmering: Bool {
    get {
      return (layer as! MQShimmeringLayer).isShimmering
    }
    set {
      (layer as! MQShimmeringLayer).isShimmering = newValue
    }
  }
  
  var shimmeringColorArray: [UIColor] {
    get {
      return (layer as! MQShimmeringLayer).shimmeringColorArray
    }
    set {
      (layer as! MQShimmeringLayer).shimmeringColorArray = newValue
    }
  }
  
  var shimmeringImage: UIImage? {
    get {
      return (layer as! MQShimmeringLayer).shimmeringImage
    }
    set {
      (layer as! MQShimmeringLayer).shimmeringImage = newValue
    }
  }
  
  var shimmeringLength: CGFloat {
    get {
      return (layer as! MQShimmeringLayer).shimmeringLength
    }
    set {
      (layer as! MQShimmeringLayer).shimmeringLength = newValue
    }
  }

  var shimmeringDuration: TimeInterval {
    get {
      return (layer as! MQShimmeringLayer).shimmeringDuration
    }
    set {
      (layer as! MQShimmeringLayer).shimmeringDuration = newValue
    }
  }

  var shimmeringRotationAngle: Double {
    get {
      return (layer as! MQShimmeringLayer).shimmeringRotationAngle
    }
    set {
      (layer as! MQShimmeringLayer).shimmeringRotationAngle = newValue
    }
  }
  
  var shimmeringTextColor: UIColor {
    get {
      return (layer as! MQShimmeringLayer).shimmeringTextColor
    }
    set {
      (layer as! MQShimmeringLayer).shimmeringTextColor = newValue
    }
  }
  
  private var contentLabel: UIView!

  override class var layerClass: AnyClass {
    
    get {
      return MQShimmeringLayer.self
    }
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
  }
  
  func setContentView(_ contentLabel: UIView) {
    self.contentLabel = contentLabel
    addSubview(contentLabel)
    (layer as! MQShimmeringLayer).setMaskLayer(contentLabel.layer)
  }
  
  @objc private func applicationWillEnterForeground() {
    isShimmering = true
  }
  
  @objc private func applicationDidEnterBackground() {
    isShimmering = false
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentLabel.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

