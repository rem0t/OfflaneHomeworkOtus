//
//  LoadService.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation

protocol LoadServiceProtocol {
    func load(page: Int, _ completion: @escaping () -> Void)
}

class LoadService {
    private let baseUrl = "https://jobs.github.com/positions.json"
    
    private let networkService: NetworkService
    
    private let databaseService: DatabaseService
    private let jobService: JobServiceProtocol
    
    init(networkService: NetworkService,
         databaseService: DatabaseService,
         jobService: JobServiceProtocol
    ) {
        self.networkService = networkService
        self.databaseService = databaseService
        self.jobService = jobService
    }
    
    private func setUrl(page: Int) -> URL? {
        URL(string: self.baseUrl + "?description=ios&page=\(page)")
    }
}

extension LoadService: LoadServiceProtocol {
    
    func load(page: Int, _ completion: @escaping () -> Void) {
        guard let url = self.setUrl(page: page) else { return }
        self.networkService.loadData(from: url, completion: {  (resultData, error) in
            guard let someData = resultData else {
                completion()
                return
            }
            self.jobService.writeJobs(from: someData, completion)
        })
    }
}
