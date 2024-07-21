//
//  CaptureQuality.swift
//  DynamicBlurView
//
//  Created by Kyohei Ito on 2017/08/17.
//  Copyright © 2017年 kyohei_ito. All rights reserved.
//

import UIKit

@objc public enum CaptureQuality: Int {
    case `default`
    case low
    case medium
    case high
}

@objc public class CaptureQualityHelper: NSObject {
    
    @objc public static func imageScale(forQuality quality: CaptureQuality) -> CGFloat {
        switch quality {
        case .default, .high:
            return 0
        case .low, .medium:
            return 1
        }
    }
    
    @objc public static func interpolationQuality(forQuality quality: CaptureQuality) -> CGInterpolationQuality {
        switch quality {
        case .default, .low:
            return .none
        case .medium, .high:
            return .default
        }
    }
}
