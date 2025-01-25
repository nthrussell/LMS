//
//  Constant.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import SwiftUI

class Constant { }

extension Constant {
    struct Screen {
        static let width  = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
}

extension Constant {
    struct Colors {
        static var AccentColor = UIColor.init(red: 5/255, green: 125/255, blue: 110/255, alpha: 1.0)
        static var SegmentColor = UIColor.init(red: 6/255, green: 223/255, blue: 161/255, alpha: 1.0)
        static var SegmentColorBG = UIColor.init(red: 200/255, green: 241/255, blue: 230/255, alpha: 1.0)
        static var proSegmentColor = UIColor.init(red: 173/255, green: 196/255, blue: 76/255, alpha: 1.0)

    }
}
