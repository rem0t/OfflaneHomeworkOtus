//
//  AppConfig.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation

public class AppConfig {
    
    public static let shared = AppConfig()
    
    private init() {
        self.setup()
    }
    
    private func setup() {
        let databaseService = DatabaseService()
        let networkService = NetworkService()
        let jobService = JobsService(databaseService: databaseService)
        
        let loadService = LoadService(
            networkService: networkService,
            databaseService: databaseService,
            jobService: jobService
        )
        ServiceLocator.shared.addService(service: jobService as JobServiceProtocol)
        ServiceLocator.shared.addService(service: loadService as LoadServiceProtocol)
    }
}
