//
//  CubeView.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/30/23.
//

import UIKit

class CubeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.backgroundColor = UIColor(cgColor: CGColor(red: 101, green: 22, blue: 102, alpha: 102)).cgColor
        backgroundColor = .yellow
        
        let freeform = UIBezierPath()
        freeform.move(to: CGPoint(x: 0, y: bounds.height / 1.2))
        freeform.addLine(to: CGPoint(x: bounds.width, y: 0))
        freeform.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        freeform.addLine(to: CGPoint(x: 0, y: bounds.height))
        freeform.addLine(to: CGPoint(x: 0, y: bounds.height / 2))
        
        let layer = CAShapeLayer()
        layer.path = freeform.cgPath
        layer.fillColor = UIColor(red: 248 / 255.0, green: 96 / 255.0, blue: 47 / 255.0, alpha: 1.0).cgColor
        self.layer.insertSublayer(layer, at: 0)
    }
}
