//
//  MQShimmeringLayer.swift
//  UIPackage
//
//  Created by mq on 2017/7/26.
//  Copyright © 2017年 MQ. All rights reserved.
//

import UIKit

class MQShimmeringLayer: CALayer, MQShimmering, CAAnimationDelegate {
  
  var isShimmering: Bool = false {
    didSet {
      guard maskLayer != nil else {
        return
      }
      
      if isShimmering != oldValue {
        if isShimmering {
          updateShimmeringInfo()
        } else {
          clearMask()
        }
      }
    }
  }
  
  var shimmeringColorArray: [UIColor] = [] {
    didSet {
    }
  }
  
  var shimmeringImage: UIImage? = nil {
    didSet {
    }
  }
  
  var shimmeringLength: CGFloat = 0 {
    didSet {
    }
  }

  var shimmeringDuration: TimeInterval = 2.0 {
    didSet {
    }
  }
  
  private var _shimmeringRotationAngle: Double = Double.pi / 2 / 90.0 * 30.0
  var shimmeringRotationAngle: Double {
    set {
      _shimmeringRotationAngle = Double.pi / 2 / 90.0 * newValue
    }
    get {
      return _shimmeringRotationAngle
    }
  }
  
  var shimmeringTextColor: UIColor = UIColor.white {
    didSet {
    }
  }

  private var maskLayer: CALayer?
  private var animationLayer: CALayer?
  
  func setMaskLayer(_ layer: CALayer) {
    maskLayer = layer
    
    if isShimmering {
      updateShimmeringInfo()
    }
  }
  
  func clearMask() {
    removeAllAnimations()
    sublayers = nil
  }

  private func updateShimmeringInfo() {
    if (isShimmering == false || maskLayer == nil) && shimmeringImage == nil {
      return
    }

    if shimmeringColorArray.count > 0 {
      if shimmeringColorArray.count == 1 {
        shimmeringColorArray.insert(shimmeringColorArray.first!.withAlphaComponent(0.5), at: 0)
        shimmeringColorArray.append(shimmeringColorArray.first!.withAlphaComponent(0.5))
      }
      
      var cgColorArray: [CGColor] = []
      var gradientLocations: [NSNumber] = []
      
      for (index, color) in shimmeringColorArray.enumerated() {
        cgColorArray.append(color.cgColor)
        gradientLocations.append(NSNumber(value: Float(index) / Float(shimmeringColorArray.count - 1)))
      }
      
      let scale = (shimmeringLength == 0) ? 0.4 : (shimmeringLength / maskLayer!.frame.width)
      
      let gradientLayer = MQGradientLayer(length: maskLayer!.frame.width * scale, contentViewHeight: maskLayer!.frame.height, rotationAngle: shimmeringRotationAngle)
      gradientLayer.colors = cgColorArray
      gradientLayer.startPoint = CGPoint(x: 0, y: 0)
      gradientLayer.endPoint = CGPoint(x: 1, y: 0)
      gradientLayer.locations = gradientLocations
      addContentLayerAnimation(atLayer: gradientLayer)

      let fixLayer = MQShimmeringFixLayer(contentLayer: gradientLayer, color: shimmeringTextColor, scaleSize: scale)
      fixLayer.mask = maskLayer
      addSublayer(fixLayer)
      
    } else if shimmeringImage != nil {
      let needScaleSize = (bounds.height / shimmeringImage!.size.height)
      
      let imageLayer = CALayer()
      imageLayer.contents = shimmeringImage!.cgImage
      imageLayer.frame = CGRect(x: 0, y: 0, width: shimmeringImage!.size.width * needScaleSize, height: shimmeringImage!.size.height * needScaleSize)
      imageLayer.contentsGravity = "resizeAspect"
      addContentLayerAnimation(atLayer: imageLayer)
      
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame = imageLayer.bounds
      gradientLayer.colors = [UIColor.white.withAlphaComponent(0.5).cgColor, UIColor.white.cgColor, UIColor.white.withAlphaComponent(0.5).cgColor]
      gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
      gradientLayer.locations = [0, 0.5, 1]
      imageLayer.mask = gradientLayer
      
      let fixLayer = MQShimmeringFixLayer(contentLayer: imageLayer, color: shimmeringTextColor, scaleSize: needScaleSize)
      fixLayer.mask = maskLayer
      addSublayer(fixLayer)
      
    }
  }
  
  private func addContentLayerAnimation(atLayer layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "position")
    animation.fromValue = CGPoint(x: -layer.frame.width / 2, y: layer.position.y)
    animation.toValue = CGPoint(x: frame.width + layer.frame.width / 2, y: layer.position.y)
    animation.duration = shimmeringDuration
    animation.repeatCount = HUGE
    layer.add(animation, forKey: nil)
  }
}

private class MQShimmeringFixLayer: CALayer {
  
  init(contentLayer: CALayer, color: UIColor, scaleSize: CGFloat = 0.4) {
    super.init()
    
    frame = CGRect(x: 0, y: 0, width: contentLayer.frame.width / scaleSize, height: contentLayer.frame.height)
    backgroundColor = color.cgColor
    addSublayer(contentLayer)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private class MQGradientLayer: CAGradientLayer {
  
  init(length: CGFloat, contentViewHeight: CGFloat, rotationAngle: Double) {
    super.init()
    
    frame = CGRect(x: 0, y: 0, width: CGFloat(cos(rotationAngle)) * length, height: CGFloat(sin(rotationAngle)) * length + contentViewHeight / CGFloat(cos(rotationAngle)))
    transform = CATransform3DMakeRotation(CGFloat(rotationAngle), 0, 0, 1)
    position = CGPoint(x: 0, y: contentViewHeight / 2)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
