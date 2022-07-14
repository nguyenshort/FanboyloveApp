//
//  OnBoardingPage.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI

struct OnBoardingPage: Identifiable {
    var id = UUID().uuidString
    var color: String
    var image: String
    var title: String
    var description: String
}

let _onBoardings: [OnBoardingPage] = [
    OnBoardingPage(color: "OnBoarding1", image: "OnBroadingImage1", title: "Second example shows you how", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    OnBoardingPage(color: "OnBoarding2", image: "OnBroadingImage2", title: "Below you can see all", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    OnBoardingPage(color: "OnBoarding3", image: "OnBroadingImage3", title: "Contributors with even smallest", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")
]
