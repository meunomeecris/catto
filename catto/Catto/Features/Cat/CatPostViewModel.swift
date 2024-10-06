//
//  CatPostViewModel.swift
//  catto
//
//  Created by Cris Messias on 13/09/24.
//

import Foundation
import SwiftUI

@Observable
class CatPostViewModel {
    var catGetUserCase: CatUserCase
    var offset = CGSize.zero
    var infoColor: Color

    init(catGetUserCase: CatUserCase, infoColor: Color) {
        self.catGetUserCase = catGetUserCase
        self.infoColor = infoColor
    }


    func swipeCard(width: CGFloat) {
        switch width {
            //left
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
            //right
        case 150...(500):
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }

    func infoSwipeCard(width: CGFloat) {
        switch width {
        case -500...(-130):
            infoColor = .red
        case 130...(500):
            infoColor = .green
        default:
            infoColor = .blue
        }
    }

}
