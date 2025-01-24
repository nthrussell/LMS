//
//  Logger.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import Foundation

final class Logger {
    static func log(_ text: String) {
        #if DEBUG
        debugPrint(text)
        #endif
    }
    
    static func log(_ objects: Any...) {
        #if DEBUG
        objects.forEach({ debugPrint($0) })
        #endif
    }
    
    private init() { }
}
