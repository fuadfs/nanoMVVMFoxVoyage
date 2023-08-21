//
//  JSONHelper.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 27/07/23.
//

import Foundation

enum JSONError: Error{
    case dataNotFound
    case invalidData
    case fileSaveError
}


struct JSONManager{
    private init(){}
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()
    static let sharedInstance = JSONManager()
}


extension JSONManager{
    func loadData<T: Decodable>(path: String, type: T.Type) throws -> [T]{
        guard let url = Bundle.main.url(forResource: path, withExtension: "json") else {
            print("json not found")
            throw JSONError.dataNotFound
        }
        do{
            let data = try? Data(contentsOf: url)
            let results = try jsonDecoder.decode([T].self, from: data!)
            return results
        } catch{
            print("error while parsing data")
            throw error
        }
    }
}

