//
//  NetworkError.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 18/12/21.
//

import Foundation

enum NetworkError {
    case jsonInvalid
    case responseError(error: Error)
}
