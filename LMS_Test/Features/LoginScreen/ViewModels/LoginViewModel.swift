//
//  LoginViewModel.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import LocalAuthentication

protocol LoginViewModel {
    func authenticateUser(completion: @escaping (Result<Bool, Error>) -> Void)
}

class DefaultLoginViewModel: ObservableObject, LoginViewModel {
    func authenticateUser(completion: @escaping (Result<Bool, Error>) -> Void) {
           let context = LAContext()
           var error: NSError?
           
           if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
               let reason = "Authenticate with Face ID or Touch ID to access your account."
               Logger.log("reason: \(reason)")
               
               context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                   DispatchQueue.main.async {
                       if success {
                           completion(.success(true))
                       } else if let authenticationError = authenticationError {
                           completion(.failure(authenticationError))
                       } else {
                           completion(.failure(NSError(domain: "BiometricLoginError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
                       }
                   }
               }
           } else {
               let unavailableError = error ?? NSError(domain: "BiometricLoginError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Your device does not support Face ID or Touch ID."])
               Logger.log("unavailableError: \(unavailableError)")
               DispatchQueue.main.async {
                   completion(.failure(unavailableError))
               }
           }
       }
}


