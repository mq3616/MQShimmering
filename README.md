# MQShimmering

仿Facebook shimmering效果, 支持角度倾斜, 颜色渐变, 图片

与Facebook不同点在于,FBShimmering是在label上加mask,不能灵活的设置label字体颜色,而MQShimmering是用label作为mask添加到view上, 可以独立设置label字体颜色和倾斜角度,并且可以使用图片作为遮罩.


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
