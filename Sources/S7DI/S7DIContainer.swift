//
//  S7DIContainer.swift
//  S7DI
//
//  Created by sp7 on 11/6/26.
//

import Foundation

public actor S7DIContainer {
    
    public static let shared: S7DIContainer = S7DIContainer()
    
    private var storeObjects: [ObjectIdentifier: () -> Any] = [:]
    
    private init () {
    }
    
    public func register<T>(type: T.Type, factory: @escaping () -> T) {
        let key = ObjectIdentifier(type)
        storeObjects[key] = factory
    }
    
    public func resolve<T>(type: T.Type) -> T? {
        let key = ObjectIdentifier(type)
        guard storeObjects.keys.contains(key) else {
            return nil
        }
        return (storeObjects[key] ?? {})() as? T
    }
}

public class Network  {
    public var urlSession: String = "===="
    public var id: String = "3"
    
    public init() {
        print("===== init Network")
    }
}
