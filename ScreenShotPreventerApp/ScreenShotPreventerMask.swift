//
//  ScreenShotPreventerMask.swift
//  ScreenShotPreventerApp
//
//  Created by Shivam on 01/02/26.
//

import SwiftUI

struct ScreenShotPreventerMask: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UITextField()
        view.isSecureTextEntry = true
        view.text = ""
        view.isUserInteractionEnabled = false
        if let autoHideLayer = findAutoHideLayer(view: view) {
            autoHideLayer.backgroundColor = UIColor.white.cgColor
        } else {
            view.layer.sublayers?.last?.backgroundColor = UIColor.white.cgColor
        }
        return view
    }
    func findAutoHideLayer(view:UIView) -> CALayer? {
        if let layers = view.layer.sublayers {
            if let layer = layers.first(where: { layer in
                layer.delegate.debugDescription.contains("UITextLayoutCanvasView")
            }){
                return layer
            }
            
        }
        return nil
    }
}

#Preview {
    ScreenShotPreventerMask()
}
