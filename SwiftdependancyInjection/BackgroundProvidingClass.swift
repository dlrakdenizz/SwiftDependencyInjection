//
//  BackgroundProvidingClass.swift
//  SwiftdependancyInjection
//
//  Created by Dilara Akdeniz on 30.09.2024.
//


//Bu kısım providing yani sağlayan kısmı. Burada protokol kullanılacak
import Foundation
import UIKit

class BackgroundProvidingClass : BackgroundProviderProtocol {
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemGray, .systemRed, .systemCyan, .systemMint]
        return backgroundColors.randomElement()!
    }
}
