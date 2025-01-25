//
//  LoginManager.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//
import Foundation

class LoginManager {
    static let shared = LoginManager()
    private init() {}

    private let loggedInKey = "isLoggedIn"

    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: loggedInKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: loggedInKey)
        }
    }

    func logIn() {
        isLoggedIn = true
    }

    func logOut() {
        isLoggedIn = false
    }
}
