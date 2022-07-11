//
//  EventStore.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 7/7/22.
//

import Foundation


class EventStore: ObservableObject {
    
    @Published var eventRecords: [EventRecord] = []
    
    static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false)
        .appendingPathComponent("events.data")
    }
    
    static func load(completion: @escaping (Result<[EventRecord], Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let fileURL = try fileURL()
                    guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                        DispatchQueue.main.async {
                            completion(.success([]))
                        }
                        return
                    }
                    let allEvents = try JSONDecoder().decode([EventRecord].self, from: file.availableData)
                    DispatchQueue.main.async {
                        completion(.success(allEvents))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
    }
    
    static func save(eventRecords: [EventRecord], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(eventRecords)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(eventRecords.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
}
