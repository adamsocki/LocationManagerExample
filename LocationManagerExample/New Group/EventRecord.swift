//
//  EventRecord.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 7/7/22.
//

import Foundation

struct EventRecord: Identifiable, Codable, Equatable {
    
    var latitude: Double
    let longitude: Double
    let locationBool: Bool
    let id: UUID
    let dateCreated: Date
    let scale: Double
    //let eventType: EventType
    let notes: String
    let altitude: Double
    let speed: Double
    let city: String
    let neighborhood: String
    let subThuroughfare: String
    let thoroughfare: String
    let state: String
    let country: String
    let subAdministrativeArea: String
    let areaOfInterest: [String]
    let ocean: String
    let inlandWater: String
    
    func getDate()->String{
         let time = Date()
         let timeFormatter = DateFormatter()
         timeFormatter.dateFormat = "HH:ss"
         let stringDate = timeFormatter.string(from: time)
         return stringDate
    }

    
    init(id: UUID = UUID(), dateCreated: Date = Date(), scale: Double, notes: String, latitude: Double, longitude: Double, locationBool: Bool, speed: Double, city: String, neighborhood: String, subThuroughfare: String, thoroughfare: String, altitude: Double, state: String, country: String, areaOfInterest: [String], subAdministrativeArea: String, ocean: String, inlandWater: String) {
        self.id = id
        self.dateCreated = dateCreated
        self.scale = scale
        //self.eventType = eventType
        self.notes = notes
        self.longitude = longitude
        self.latitude = latitude
        self.locationBool = locationBool
//        self.customDate = customDate
//        self.customDateBool = customDateBool
        self.speed = speed
        self.city = city
        self.neighborhood = neighborhood
        self.subThuroughfare = subThuroughfare
        self.thoroughfare = thoroughfare
        self.altitude = altitude
        self.state = state
        self.country = country
        self.areaOfInterest = areaOfInterest
        self.subAdministrativeArea = subAdministrativeArea
        self.ocean = ocean
        self.inlandWater = inlandWater
    }   
    
    

}


extension EventRecord {
	static let sampleData: [EventRecord] = 
	[
        EventRecord(scale: 45, notes: "The night felt wet", latitude: 95, longitude: 100, locationBool: true, speed: 10, city: "Kemah", neighborhood: "Kemah Wet", subThuroughfare: "Bug Street", thoroughfare: "Tran", altitude: 244, state: "palacio", country: "Tron", areaOfInterest: ["Mr. Robot", ""], subAdministrativeArea: "Place", ocean: "Atlantic", inlandWater: "Lake Placid"),
        EventRecord(scale: 45, notes: "The night felt wet", latitude: 95, longitude: 100, locationBool: true, speed: 10, city: "Kemah", neighborhood: "Kemah Wet", subThuroughfare: "Bug Street", thoroughfare: "Tran", altitude: 244, state: "monkeyville", country: "Planet of the Apes", areaOfInterest: ["The Movies", "" ], subAdministrativeArea: "Place", ocean: "Pacific", inlandWater: "River Grade")
        
        //EventRecord(scale:45, notes: "The night heat was strong", latitude: 95, longitude: 100, locationBool: true, customDate: .init(), customDateBool: false),
       // EventRecord(scale:60, notes: "She didn't know how she got there", latitude: 100, longitude: 30, locationBool: true, customDate: .init(), customDateBool: true)
	]
}
