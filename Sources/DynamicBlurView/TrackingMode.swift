//
//  TrackingMode.swift
//  DynamicBlurView
//
//  Created by Kyohei Ito on 2017/08/17.
//  Copyright © 2017年 kyohei_ito. All rights reserved.
//

import UIKit

@objc public enum TrackingMode: Int {
    case tracking
    case common
    case none
}

@objc public class TrackingModeHelper: NSObject {
    
    @objc public static func description(forMode mode: TrackingMode) -> String {
        switch mode {
        case .tracking:
            return RunLoop.Mode.tracking.rawValue
        case .common:
            return RunLoop.Mode.common.rawValue
        case .none:
            return ""
        }
    }
}

