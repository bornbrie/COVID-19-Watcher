//
//  AppPreferences.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/21/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation
import Combine

final class AppPreferences: ObservableObject {
    
    #if os(watchOS)
    static var shared = AppPreferences()
    #endif
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault("ShowOnStart", defaultValue: false)
    var showOnStart: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault("UseiCloud", defaultValue: false)
    var useiCloud: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault("WatchingCountries", defaultValue: [])
    var watchingCountries: [String] {
        willSet {
            objectWillChange.send()
        }
    }
    
    func isWatching(country slug: String) -> Bool {
        return watchingCountries.contains(slug)
    }
    
    func toggleWatching(country slug: String) {
        if isWatching(country: slug) {
            watchingCountries.removeAll { $0 == slug }
        } else {
            watchingCountries.append(slug)
        }
    }
}

@propertyWrapper
struct UserDefault<T>: DataStore {
    var key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

@propertyWrapper
struct iCloudUserDefault<T>: DataStore {
    var key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

protocol DataStore {
    associatedtype T
    var key: String { get set }
    var defaultValue: T { get }
    init(_ key: String, defaultValue: T)
    var wrappedValue: T { get set }
}

extension DataStore {
    
}
