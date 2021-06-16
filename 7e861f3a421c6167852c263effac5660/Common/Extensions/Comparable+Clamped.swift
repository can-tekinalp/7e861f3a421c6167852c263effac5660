//
//  Comparable+Clamped.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 16.06.2021.
//

import Foundation

extension Comparable {
    
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
