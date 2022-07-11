//
//  SpecificEventDetailsView.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 7/9/22.
//

import SwiftUI
import MapKit

struct SpecificEventDetailsView: View {
    @Binding var eventRecord: EventRecord
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text(eventRecord.dateCreated, format: .dateTime.day().month().year())
                    Text(eventRecord.dateCreated, format: .dateTime.hour().minute())
                    let latitude = String(format: "%.4d", eventRecord.latitude)
                    Text("Latitude: " + latitude)
                    let longitude = String(format: "%.4d", eventRecord.longitude)
                    Text("Longitude: " + longitude)
                }
                Spacer()
            }
            
            HStack {
                VStack (alignment:.leading){
                    let altitude = String(format: "%.2f", eventRecord.altitude)
                    Text("Altitude: " + altitude)
                    
                    Text("Location")
                    HStack {
                        MapView(latitude: eventRecord.latitude, longitude: eventRecord.longitude)
                            .frame(width: 300, height: 300, alignment: .leading)
                            .padding()
                    }
                    Text("Address: " + eventRecord.subThuroughfare + eventRecord.thoroughfare)
                    Text("Neighborhood: " + eventRecord.neighborhood)
                    Text("City: " + eventRecord.city)
                    Text("Sub Admin Area: " + eventRecord.subAdministrativeArea)
                    Text("Administrative Area: " + eventRecord.state)
                }
                Spacer()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Country: " + eventRecord.country)
                    Text("Ocean: " + eventRecord.ocean)
                    Text("Inland Water: " + eventRecord.inlandWater)
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
    
}


struct SpecificEventDetailsView_Previews: PreviewProvider {
    static var eventRecord = EventRecord.sampleData[0]
    static var previews: some View {
        SpecificEventDetailsView(eventRecord: .constant(eventRecord))
    }
}
