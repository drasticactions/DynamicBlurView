//
//  CGContext+CGImage.swift
//  DynamicBlurView
//
//  Created by Kyohei Ito on 2017/08/17.
//  Copyright © 2017年 kyohei_ito. All rights reserved.
//

import UIKit

extension CGContext {
    static func imageContext(in rect: CGRect, isOpaque opaque: Bool, quality: CaptureQuality) -> CGContext? {
        UIGraphicsBeginImageContextWithOptions(rect.size, opaque, CaptureQualityHelper.imageScale(forQuality: quality))
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        context.translateBy(x: -rect.origin.x, y: -rect.origin.y)
        context.interpolationQuality = CaptureQualityHelper.interpolationQuality(forQuality: quality)

        return context
    }

    func makeImage(with blendColor: UIColor?, blendMode: CGBlendMode, size: CGSize) -> CGImage? {
        if let color = blendColor {
            setFillColor(color.cgColor)
            setBlendMode(blendMode)
            fill(CGRect(origin: .zero, size: size))
        }

        return makeImage()
    }
}
