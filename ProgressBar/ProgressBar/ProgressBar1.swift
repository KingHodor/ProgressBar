//
//  ProgressView.swift
//  jnj
//
//  Created by Zehra Alptekin on 12/13/18.
//  Copyright © 2018 Evercoin. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    public var value:Int = 0 {
        didSet {
            if value < 0 {
                return
            }else if value > itemCount{
                return
            }
          drawView()
        }
    }
    fileprivate let itemCount = 7
    
    
    var color:UIColor = UIColor.green {
        didSet {
            _color = color
        }
    }
    var _color:UIColor?
    
    fileprivate var innerViews: [UIView] = []
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    private func drawView(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor.white
        self.innerViews.removeAll()
        let totalWidth = frame.size.width
        let cgItemCount = CGFloat(integerLiteral: itemCount)
        let calculate:CGFloat = (cgItemCount * (cgItemCount + 1)) / 2
        let minWidth = totalWidth / calculate
        var xPosition:CGFloat = 0
        for i in 0..<value {
            let itemWidth = (CGFloat(integerLiteral: i) + 1) * minWidth - 1.0
            let itemView = UIView(frame: CGRect(x: xPosition, y: 0, width: itemWidth, height: frame.size.height))
            itemView.backgroundColor = _color
            self.addSubview(itemView)
            self.innerViews.append(itemView)
            xPosition = xPosition + itemWidth + 1.0
        }
    }
    private func clearAll(){
        for item in innerViews{
            item.removeFromSuperview()
        }
    }
}
