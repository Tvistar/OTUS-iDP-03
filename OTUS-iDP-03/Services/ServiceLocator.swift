//
//  EpisodesService.swift
//  OTUS-iDP-03
//
//  Created by Igor Andryushenko on 14.04.2021.
//

class ServiceLocator {

    public static let shared = ServiceLocator()
    private var registry : [String: Any] = [:]
    
    func registerService<T>(service: T) {
        let key = "\(T.self)"
        registry[key] = service
    }

    func getService<T>() -> T {
        let key = "\(T.self)"
        return registry[key] as! T
    }
}

