//
//  Extenstion + Color.swift
//  Instagram_UI
//
//  Created by jo on 25/12/24.
//


import SwiftUI


struct AppColors {
    static let IG_Blue = Color(hex: "3797EF")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue >> 16) & 0xff) / 255
        let green = Double((rgbValue >> 8) & 0xff) / 255
        let blue = Double(rgbValue & 0xff) / 255

        self.init(red: red, green: green, blue: blue)
    }
}
