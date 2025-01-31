//
//  ProfileModel.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import Foundation

struct TeamDescription: Codable {
    let teamName: String?
    let teamLogo: String?
    let sponsorLogo: String?
    let teamDescription: String?
}

extension TeamDescription {
    init(from profileArray: FeaturedModelArray) {
        self.teamName = profileArray.teamName
        self.teamLogo = profileArray.teamLogo
        self.sponsorLogo = profileArray.sponsorLogo
        self.teamDescription = profileArray.teamDescription
    }
}

struct FirstStack: Codable {
    let gamesPlayed: Int
    let winRatio: Double
    let wins: Int
    let loses: Int
}

struct SecondStack: Codable {
    let worldRank: Int
    let countryRank: Int
    let regionalRank: Int
    let form: String
}

struct TopPlayer: Codable {
    let userId: Int
    let firstName: String
    let lastName: String
    let nationality: Int
    let userPicture: String
    let worldRank: Int
    let nationalRank: Int
}

struct HonourAndAward: Codable {
    let champion: Int
    let runnersUp: Int
}

struct RecentResult: Codable {
    let teamId: Int
    let teamName: String
    let teamLogo: String
    let oppoTeamId: Int
    let oppTeamName: String
    let oppLogo: String
    let matchInfo: String
    let dateTime: String
        
    var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let date = inputFormatter.date(from: dateTime) else { return "" }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EEEE dd MMMM"
        
        return outputFormatter.string(from: date)
    }
}

struct UpcomingFixture: Codable {
    let teamId: Int
    let teamName: String
    let teamLogo: String
    let oppoTeamId: Int
    let oppTeamName: String
    let oppLogo: String?
    let dateTime: String
    
    var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let date = inputFormatter.date(from: dateTime) else { return "" }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EEEE dd MMMM"
        
        return outputFormatter.string(from: date)
    }
}

struct RecentVideo: Codable {
    let teamFixture: Int
    let date: String
    let playbackUrl: String
    let youtube: String
    let fixDate: String
    let teamId: Int
    
    var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let date = inputFormatter.date(from: fixDate) else { return "" }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM/yy '|' 'Highlights'"
        
        return outputFormatter.string(from: date)
    }
}

struct Tournament: Codable {
    let tournament: String
    let position: String
    let winningYear: Int
}

// MARK: - WelcomeElement
struct FeaturedModelArray: Codable {
    let teamName: String?
    let teamLogo: String?
    let sponsorLogo: String?
    let teamDescription: String?
    let gamesPlayed: Int?
    let winRatio: Double?
    let wins, loses, worldRank, countryRank: Int?
    let regionalRank: Int?
    let form: String?
    let userID: Int?
    let firstName, lastName: String?
    let nationality: Int?
    let userPicture: String?
    let nationalRank, champion, runnersUp, teamID: Int?
    let oppoTeamID: Int?
    let oppTeamName: String?
    let oppLogo: String?
    let matchInfo, dateTime: String?
    let teamFixture: Int?
    let date, playbackURL: String?
    let youTube: String?
    let fixDate, tournament: String?
    let position: Position?
    let winnigYear: Int?
    
    enum CodingKeys: String, CodingKey {
        case teamName = "TeamName"
        case teamLogo = "TeamLogo"
        case sponsorLogo = "SponsorLogo"
        case teamDescription = "TeamDescription"
        case gamesPlayed
        case winRatio = "WinRatio"
        case wins = "Wins"
        case loses = "Loses"
        case worldRank = "WorldRank"
        case countryRank = "CountryRank"
        case regionalRank = "RegionalRank"
        case form = "Form"
        case userID = "UserId"
        case firstName = "FirstName"
        case lastName = "LastName"
        case nationality = "Nationality"
        case userPicture = "UserPicture"
        case nationalRank = "NationalRank"
        case champion = "Champion"
        case runnersUp = "RunnersUp"
        case teamID = "TeamId"
        case oppoTeamID = "oppoTeamId"
        case oppTeamName, oppLogo
        case matchInfo = "MatchInfo"
        case dateTime = "DateTime"
        case teamFixture = "TeamFixture"
        case date = "Date"
        case playbackURL = "PlaybackUrl"
        case youTube = "YouTube"
        case fixDate = "FixDate"
        case tournament = "Tournament"
        case position = "Position"
        case winnigYear = "WinnigYear"
    }
}

enum Position: String, Codable {
    case champion = "Champion"
    case runnersUp = "RunnersUp"
}

//0. Description - array[0]
//1. firstStack - array[1]
//2. secondStack - array[2]
//3. TopBatsMan - array[3]
//4. TopBowler - array[4]
//5. TopAllRounder - array[5]
//6. HonoursAndAwards - array[6]
//7. RecentResults - array[7]
//8. UpcomingFixture - array[8]
//9. RecentVideos - array[9]
//10. tournament - array[10]

typealias FeaturedModel = [[FeaturedModelArray]]

extension Array where Element == [FeaturedModelArray] {
    func mapToTeamDescription() -> TeamDescription? {
        guard let descriptionArray = self[safe: 0]?.first else { return nil }
        return TeamDescription(
            teamName: descriptionArray.teamName,
            teamLogo: descriptionArray.teamLogo,
            sponsorLogo: descriptionArray.sponsorLogo,
            teamDescription: descriptionArray.teamDescription
        )
    }
    
    func mapToFirstStack() -> FirstStack? {
        guard let firstStackArray = self[safe: 1]?.first else { return nil }
        return FirstStack(
            gamesPlayed: firstStackArray.gamesPlayed ?? 0,
            winRatio: firstStackArray.winRatio ?? 0.0,
            wins: firstStackArray.wins ?? 0,
            loses: firstStackArray.loses ?? 0
        )
    }
    
    func mapToSecondStack() -> SecondStack? {
        guard let secondStackArray = self[safe: 2]?.first else { return nil }
        return SecondStack(
            worldRank: secondStackArray.worldRank ?? 0,
            countryRank: secondStackArray.countryRank ?? 0,
            regionalRank: secondStackArray.regionalRank ?? 0,
            form: secondStackArray.form ?? ""
        )
    }
    
    func mapToTopBatsman() -> [TopPlayer] {
        return self[safe: 3]?.compactMap { profileArray in
            guard let userId = profileArray.userID else { return nil }
            return TopPlayer(
                userId: userId,
                firstName: profileArray.firstName ?? "",
                lastName: profileArray.lastName ?? "",
                nationality: profileArray.nationality ?? 0,
                userPicture: profileArray.userPicture ?? "",
                worldRank: profileArray.worldRank ?? 0,
                nationalRank: profileArray.nationalRank ?? 0
            )
        } ?? []
    }
    
    func mapToTopBowler() -> [TopPlayer] {
        return self[safe: 4]?.compactMap { profileArray in
            guard let userId = profileArray.userID else { return nil }
            return TopPlayer(
                userId: userId,
                firstName: profileArray.firstName ?? "",
                lastName: profileArray.lastName ?? "",
                nationality: profileArray.nationality ?? 0,
                userPicture: profileArray.userPicture ?? "",
                worldRank: profileArray.worldRank ?? 0,
                nationalRank: profileArray.nationalRank ?? 0
            )
        } ?? []
    }
    
    func mapToTopAllRounder() -> [TopPlayer] {
        return self[safe: 5]?.compactMap { profileArray in
            guard let userId = profileArray.userID else { return nil }
            return TopPlayer(
                userId: userId,
                firstName: profileArray.firstName ?? "",
                lastName: profileArray.lastName ?? "",
                nationality: profileArray.nationality ?? 0,
                userPicture: profileArray.userPicture ?? "",
                worldRank: profileArray.worldRank ?? 0,
                nationalRank: profileArray.nationalRank ?? 0
            )
        } ?? []
    }
    
    func mapToHonourAndAward() -> HonourAndAward? {
        guard let honoursArray = self[safe: 6]?.first else { return nil }
        return HonourAndAward(
            champion: honoursArray.champion ?? 0,
            runnersUp: honoursArray.runnersUp ?? 0
        )
    }
    
    func mapToRecentResults() -> [RecentResult] {
        return self[safe: 7]?.compactMap { profileArray in
            guard
                let teamId = profileArray.teamID,
                let teamName = profileArray.teamName,
                let teamLogo = profileArray.teamLogo,
                let oppoTeamId = profileArray.oppoTeamID,
                let oppTeamName = profileArray.oppTeamName,
                let oppLogo = profileArray.oppLogo,
                let matchInfo = profileArray.matchInfo,
                let dateTime = profileArray.dateTime
            else {
                return nil
            }
            return RecentResult(
                teamId: teamId,
                teamName: teamName,
                teamLogo: teamLogo,
                oppoTeamId: oppoTeamId,
                oppTeamName: oppTeamName,
                oppLogo: oppLogo,
                matchInfo: matchInfo,
                dateTime: dateTime
            )
        } ?? []
    }
    
    func mapToUpcomingFixtures() -> [UpcomingFixture] {
        return self[safe: 8]?.compactMap { profileArray in
            guard
                let teamId = profileArray.teamID,
                let teamName = profileArray.teamName,
                let teamLogo = profileArray.teamLogo,
                let oppoTeamId = profileArray.oppoTeamID,
                let oppTeamName = profileArray.oppTeamName,
                let dateTime = profileArray.dateTime
            else {
                return nil
            }
            return UpcomingFixture(
                teamId: teamId,
                teamName: teamName,
                teamLogo: teamLogo,
                oppoTeamId: oppoTeamId,
                oppTeamName: oppTeamName,
                oppLogo: profileArray.oppLogo,
                dateTime: dateTime
            )
        } ?? []
    }
    
    func mapToRecentVideos() -> [RecentVideo] {
        return self[safe: 9]?.compactMap { profileArray in
            guard
                let teamFixture = profileArray.teamFixture,
                let date = profileArray.date,
                let playbackUrl = profileArray.playbackURL,
                let youtube = profileArray.youTube,
                let fixDate = profileArray.fixDate,
                let teamId = profileArray.teamID
            else {
                return nil
            }
            return RecentVideo(
                teamFixture: teamFixture,
                date: date,
                playbackUrl: playbackUrl,
                youtube: youtube,
                fixDate: fixDate,
                teamId: teamId
            )
        } ?? []
    }
    
    func mapToTournaments() -> [Tournament] {
        return self[safe: 10]?.compactMap { profileArray in
            guard
                let tournament = profileArray.tournament,
                let position = profileArray.position,
                let winningYear = profileArray.winnigYear
            else {
                return nil
            }
            return Tournament(
                tournament: tournament,
                position: position.rawValue,
                winningYear: winningYear
            )
        } ?? []
    }
}

// Safe subscript for array access to prevent out-of-bounds errors
extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
