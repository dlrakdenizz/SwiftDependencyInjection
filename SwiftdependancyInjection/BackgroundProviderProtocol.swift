//
//  BackgroundProviderProtocol.swift
//  SwiftdependancyInjection
//
//  Created by Dilara Akdeniz on 30.09.2024.
//


//Bu kısım provider yani sağlayıcı. Bu kısımda protokol oluşturuluyor
import Foundation
import UIKit

protocol BackgroundProviderProtocol {
    
    var backgroundColor : UIColor {
        get
    }
}
