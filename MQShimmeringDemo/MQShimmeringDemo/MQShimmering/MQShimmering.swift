//
//  MQShimmering.swift
//  UIPackage
//
//  Created by mq on 2017/7/26.
//  Copyright © 2017年 MQ. All rights reserved.
//

import Foundation
import UIKit

protocol MQShimmering {
  var isShimmering: Bool { get set }
  var shimmeringColorArray: [UIColor] { get set}
  var shimmeringImage: UIImage? { get set }
  
  var shimmeringLength: CGFloat { get set}
  var shimmeringDuration: TimeInterval { get set }
  var shimmeringRotationAngle: Double { get set}
  var shimmeringTextColor: UIColor { get set }
}
