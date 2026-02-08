//
//  AppStorageManager.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import SwiftUI

protocol CacheManagerProtocol {
    associatedtype T
    static var shared: T { get }
    func cacheObject<T: Encodable>(object: T, key: CacheKey)
    func retrieveCachedObject<T: Decodable>(object: T.Type, key: CacheKey) -> T?
    func removeObject(key: CacheKey)
}

enum CacheKey: String {
    case seenSplashView
    case userData
}

class AppStore : CacheManagerProtocol {
   
    // MARK: AppStorage Backing
    @AppStorage(CacheKey.seenSplashView.rawValue) var seenSplashView = false
    
    @AppStorage(CacheKey.userData.rawValue) private var userData: Data = Data()
    static let shared: AppStore = {
        AppStore()
    }()

    private init() {}
    
    // MARK: Cache Objects
    func cacheObject<T: Encodable>(object: T, key: CacheKey) {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(object)
            setData(data, for: key)
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }

    func retrieveCachedObject<T: Decodable>(object: T.Type, key: CacheKey) -> T? {
        let data = getData(for: key)
        guard !data.isEmpty else { return nil }

        let jsonDecoder = JSONDecoder()
        do {
            let object = try jsonDecoder.decode(T.self, from: data)
            return object
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }

    func removeObject(key: CacheKey) {
        setData(Data(), for: key)
    }
    
    // MARK: Private Helpers
    private func getData(for key: CacheKey) -> Data {
        switch key {
        case .userData:
            return userData
        default:
            return Data()
        }
    }

    private func setData(_ data: Data, for key: CacheKey) {
        switch key {
        case .userData:
            userData = data
        default:
            break
        }
    }
}
