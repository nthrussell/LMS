//
//  SquadListModel.swift
//  LMS_Test
//
//  Created by russel on 29/1/25.
//

import Foundation

// MARK: - WelcomeElement
struct SquadListModel: Codable {
    let userID: Int
    let firstName, lastName: String
    let userPicture: String
    let playerInfo: PlayerInfo
    let innings, runs: Int
    let average, strikeRate: Double
    let highestScore, fifties, hundred, worldRank: Int
    let nationalRank, isFormar: Int

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case firstName = "FirstName"
        case lastName = "LastName"
        case userPicture = "UserPicture"
        case playerInfo = "PlayerInfo"
        case innings = "Innings"
        case runs = "Runs"
        case average = "Average"
        case strikeRate = "StrikeRate"
        case highestScore = "HighestScore"
        case fifties = "Fifties"
        case hundred = "Hundred"
        case worldRank = "WorldRank"
        case nationalRank = "NationalRank"
        case isFormar = "IsFormar"
    }
}

enum PlayerInfo: String, Codable {
    case leftHandedPinchHitter = "Left handed - pinch hitter"
    case leftHandedStrokePlayer = "Left handed - stroke player"
    case nA = "N/A"
    case rightArmOffSpin = "Right arm off spin"
    case rightHandedAccumulator = "Right handed - accumulator"
    case rightHandedPinchHitter = "Right handed - pinch hitter"
    case rightHandedStrokePlayer = "Right handed - stroke player"
}
