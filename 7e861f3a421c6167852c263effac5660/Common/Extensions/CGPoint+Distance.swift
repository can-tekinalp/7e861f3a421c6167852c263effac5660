//
//  CGPoint+Distance.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 16.06.2021.
//

import UIKit

extension CGPoint {
    
    func distance(to: CGPoint) -> CGFloat {
        let xDistance = self.x - to.x
        let yDistance = self.y - to.y
        return sqrt(xDistance * xDistance + yDistance * yDistance)
    }
}
