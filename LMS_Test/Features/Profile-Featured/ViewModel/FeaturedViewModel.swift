//
//  FeaturedViewModel.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import Foundation
import Combine

protocol FeaturedViewModel {
    var featuredApiService: FeaturedApiService { get }
    func callApi(onCompletion: @escaping () -> Void)
    func getSquadList(onCompletion: @escaping () -> Void)
    
    var teamDescription: TeamDescription? { get set }
    var firstStack: FirstStack? { get set }
    var secondStack: SecondStack? { get set }
    var topBatsman: [TopPlayer]? { get set }
    var topBowler: [TopPlayer]? { get set }
    var topAllRounder: [TopPlayer]? { get set }
    var squadList: [SquadListModel]? { get set }
    var honours: HonourAndAward? { get set }
    var recentResults: [RecentResult]? { get set }
    var upcomingFixtures: [UpcomingFixture]? { get set }
    var recentVideos: [RecentVideo]? { get set }
    var tournaments: [Tournament]? { get set }
}

class DefaultFeaturedViewModel: FeaturedViewModel {
    var featuredApiService: FeaturedApiService
    var cancellable = Set<AnyCancellable>()
    
    var teamDescription: TeamDescription?
    var firstStack: FirstStack?
    var secondStack: SecondStack?
    var topBatsman: [TopPlayer]?
    var topBowler: [TopPlayer]?
    var topAllRounder: [TopPlayer]?
    var squadList: [SquadListModel]?
    var honours: HonourAndAward?
    var recentResults: [RecentResult]?
    var upcomingFixtures: [UpcomingFixture]?
    var recentVideos: [RecentVideo]?
    var tournaments: [Tournament]?
    
    
    init(featuredApiService: FeaturedApiService = DefaultFeaturedApiService()) {
        self.featuredApiService = featuredApiService
    }
    
    func callApi(onCompletion: @escaping () -> Void) {
        featuredApiService
            .fetchSummery()
            .receive(on: DispatchQueue.main)
            .sink { status in
                debugPrint("status is:\(status)")
            } receiveValue: { [weak self] payload in
                guard let self = self else { return }
                // Mapping to models
                teamDescription = payload.mapToTeamDescription()
                firstStack = payload.mapToFirstStack()
                secondStack = payload.mapToSecondStack()
                topBatsman = payload.mapToTopBatsman()
                topBowler = payload.mapToTopBowler()
                topAllRounder = payload.mapToTopAllRounder()
                honours = payload.mapToHonourAndAward()
                recentResults = payload.mapToRecentResults()
                upcomingFixtures = payload.mapToUpcomingFixtures()
                recentVideos = payload.mapToRecentVideos()
                tournaments = payload.mapToTournaments()
                
                Logger.log("top batsman:\(topBatsman ?? [])")
                Logger.log("top bowler:\(topBowler ?? [])")
                Logger.log("top topAllRounder:\(topAllRounder ?? [])")

                
                onCompletion()
            }
            .store(in: &cancellable)
    }
    
    func getSquadList(onCompletion: @escaping () -> Void) {
        featuredApiService
            .fetchSquadList()
            .receive(on: DispatchQueue.main)
            .sink { status in
                debugPrint("status is:\(status)")
            } receiveValue: { [weak self] payload in
                guard let self = self else { return }
                // Mapping to models
                self.squadList = payload
                onCompletion()
            }
            .store(in: &cancellable)
    }
    
}
