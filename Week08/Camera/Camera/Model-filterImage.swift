//
//  Model-filer.swift
//  CaptureRecorder
//
//  Created by jht2 on 3/20/25.
//

import SwiftUI
import AVFoundation
//import Photos
import CoreImage.CIFilterBuiltins

enum VideoEffect: String, CaseIterable {
    case normal = "Normal"
    case bright = "Bright"
    case faded = "Faded"
    case noir = "Noir"
    case dream = "Dream"
    
    var filterName: String? {
        switch self {
        case .normal: return nil
        case .bright: return "CIColorControls"
        case .faded: return "CIColorControls"
        case .noir: return "CIPhotoEffectNoir"
        case .dream: return "CIBloom"
        }
    }
}

// Apply the filter and preview
//
extension Model {
    func filterImage(_ pixelBuffer: CVPixelBuffer) -> (CIImage,Bool) {
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        var filteredImage = ciImage
        var changed = false
        if let filterName = currentEffect.filterName {
            //      print("filterName: \(filterName)")
            if let filter = CIFilter(name: filterName) {
                //        print("filterImage filter.inputKeys: \(filter.inputKeys)")
                filter.setValue(ciImage, forKey: kCIInputImageKey)
                // Set additional parameters for specific filters
                switch currentEffect {
                case .bright:
                    // filter.setValue(2, forKey: kCIInputEVKey)
                    filter.setValue(0.4, forKey: "inputBrightness")
                    filter.setValue(1.8, forKey: "inputSaturation")
                    filter.setValue(1.3, forKey: "inputContrast")
                case .faded:
                    filter.setValue(0.8, forKey: "inputSaturation")
                    filter.setValue(0.8, forKey: "inputContrast")
                // case .noir:
                    // filter.setValue(-1, forKey: kCIInputEVKey)
                case .dream:
                    filter.setValue(0.8, forKey: kCIInputIntensityKey)
                default:
                    break
                }
                if let outputImage = filter.outputImage {
                    filteredImage = outputImage
                    changed = true
                    //          print("outputImage = filter.outputImage")
                } else {
                    print("no filter.outputImage")
                }
            } else {
                print("no filter = CIFilter(name: filterName)")
            }
        }
        
        // Dispatch update to preview
        if let cgImage = context!.createCGImage(filteredImage, from: filteredImage.extent) {
            DispatchQueue.main.async {
                self.previewImage = cgImage
            }
        }
        return (filteredImage,changed)
    }
}

// https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html


