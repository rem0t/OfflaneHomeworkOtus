//
//  ServiceLocator.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation

public protocol ServiceLocatorProtocol {
    
    func getService<T>(type: T.Type) -> T?
    
    func addService<T>(service: T)
}

public class ServiceLocator: ServiceLocatorProtocol {
    
    public static let shared = ServiceLocator()
    
    private init() {}
    
    private var services: [String: Any] = [:]
    
    public func getService<T>(type: T.Type) -> T? {
        return self.services[String(describing: type)] as? T
    }
    
    public func addService<T>(service: T) {
        let type = String(describing: T.self)
        if self.services[type] == nil {
            self.services[type] = service
        }
    }
}
