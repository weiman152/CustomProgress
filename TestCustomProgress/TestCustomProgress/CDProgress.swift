//
//  CDProgress.swift
//  TestCustomProgress
//
//  Created by iOS on 2018/2/1.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class CDProgress: UIView {
    
    ///设置字体
    var font: UIFont = .systemFont(ofSize: 16) {
        didSet {
            topLabel.font = font
            bottomLabel.font = font
        }
    }
    ///设置边框的颜色
    var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    //设置边框宽度
    var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    private var progress: CGFloat = 0.0
    
    lazy var topLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = .black
        $0.text = "0/0"
        return $0
    }( UILabel() )
    lazy var bottomLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = .red
        $0.text = "0/0"
        return $0
    }( UILabel() )
    lazy var progressView: UIView = {
        $0.backgroundColor = .orange
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 20
        return $0
    }( UIView() )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.orange.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 20
        
        addSubview(bottomLabel)
        addSubview(progressView)
        progressView.addSubview(topLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        progressView.frame = CGRect(x: 0, y: 0,
                                    width: bounds.size.width * progress,
                                    height: bounds.size.height)
        bottomLabel.frame = bounds
        topLabel.frame = bottomLabel.frame
    }
}

extension CDProgress {
    
    func set(current: Int, total: Int, duration: TimeInterval? = nil) {
        
        progress = CGFloat(current) / CGFloat(total)
        topLabel.text = "\(current)/ \(total)"
        bottomLabel.text = topLabel.text
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration ?? 0)
        progressView.frame.size.width = bounds.width * progress
        UIView.commitAnimations()
    }
    
    /// 设置进度颜色
    func set(progressColor: UIColor){
        progressView.backgroundColor = progressColor
    }
    /// 设置圆角角度
    func set(cornerRadius:CGFloat){
        layer.cornerRadius = cornerRadius
        progressView.layer.cornerRadius = cornerRadius
    }
}
