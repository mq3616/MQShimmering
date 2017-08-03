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
  /*
    控制开始/停止动画
   */
  var isShimmering: Bool { get set }
  /*
    闪光颜色数组
    当只有一个元素是,会自动补充淡出透明色,若想用纯色添加两个相同颜色即可
   */
  var shimmeringColorArray: [UIColor] { get set}
  /*
    闪光使用图片遮罩
   */
  var shimmeringImage: UIImage? { get set }
  /*
    闪光层的长度,默认为contentView长度的0.4
   */
  var shimmeringLength: CGFloat { get set}
  /*
    动画时长,默认为2.0s
   */
  var shimmeringDuration: TimeInterval { get set }
  /*
    闪光层倾斜角度
   */
  var shimmeringRotationAngle: Double { get set}
  /*
    contentLabel的文字颜色
    注意: 直接设置label的textColor不会生效
   */
  var shimmeringTextColor: UIColor { get set }
}
