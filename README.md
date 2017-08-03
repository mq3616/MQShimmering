# MQShimmering
仿Facebook shimmering效果, 支持角度倾斜, 颜色渐变, 图片

eg:
let shimmeringView = MQShimmeringView(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
shimmeringView.shimmeringColorArray = [UIColor.white.withAlphaComponent(0.1), UIColor.white.withAlphaComponent(1), UIColor.white.withAlphaComponent(0.1)]
shimmeringView.shimmeringTextColor = UIColor.blue
shimmeringView.shimmeringRotationAngle = 20.0
shimmeringView.shimmeringLength = 200
shimmeringView.isShimmering = true
view.addSubview(shimmeringView)

let contentLabel = UILabel(frame: shimmeringView.bounds)
contentLabel.font = UIFont.systemFont(ofSize: 30)
contentLabel.text = "hello world"
shimmeringView.setContentView(contentLabel)
