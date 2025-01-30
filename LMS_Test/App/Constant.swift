//
//  Constant.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import SwiftUI

class Constant { }

extension Constant {
    struct URL {
        static let  baseURL = "https://newstagingshopapi.lastmanstands.com"
    }
}

extension Constant {
    struct Screen {
        static let width  = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
}

extension Constant {
    struct Colors {
        static var AccentColor = UIColor.init(red: 5/255, green: 125/255, blue: 110/255, alpha: 1.0)
        static var BGColor = UIColor.init(red: 246/255, green: 250/255, blue: 248/255, alpha: 1.0)
        static var SegmentColor = UIColor.init(red: 6/255, green: 223/255, blue: 161/255, alpha: 1.0)
        static var SegmentColorBG = UIColor.init(red: 200/255, green: 241/255, blue: 230/255, alpha: 1.0)
        static var proSegmentColor = UIColor.init(red: 173/255, green: 196/255, blue: 76/255, alpha: 1.0)
        static var deepGreenColor = UIColor.init(red: 11/255, green: 53/255, blue: 57/255, alpha: 1.0)
        static var desTextColor = UIColor.init(red: 42/255, green: 80/255, blue: 80/255, alpha: 1.0)
        static var textDeepGreenColor = UIColor.init(red: 12/255, green: 53/255, blue: 57/255, alpha: 1.0)

    }
}

extension Constant {
    struct Fonts {
        static let ptSansBold = "PTSans-Bold"
        static let ptSansBoldItalic = "PTSans-BoldItalic"
        static let ptSansItalic = "PTSans-Italic"
        static let ptSansRegular = "PTSans-Regular"
    }
}
