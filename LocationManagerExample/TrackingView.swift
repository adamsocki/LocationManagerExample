//
//  TrackingView.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 6/6/22.
//

import Foundation
import SwiftUI
import MapKit


struct TrackingView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    //@Binding var event: Event
    
    @Binding var eventRecord: [EventRecord]
    
    //@Environment(\.exportFiles) var exportAction
    
    @State private var eventRecordedPopup = false
    @State private var notes: String = ""
    
    @State private var showingExporter = false
    
//    let name: String = ""
//    let latitude: Double = 0.0
//    let longitude: Double = 0.0
//   // let altitude: Double
//    let speed: Double = 0.0
//    let city: String = ""
//    let neighborhood: String = ""
//    let subThuroughfare: String = ""
//    let thoroughfare: String = ""
   
    var coordinate: CLLocationCoordinate2D? {
        locationViewModel.lastSeenLocation?.coordinate
    }
    
    
    
    
    var body: some View {
        VStack {
            VStack {
                
                NavigationLink(destination: RecordedEventListView(eventRecords: $eventRecord)){
                    RecordedEventViewIcon()
                }
            }
            Spacer()
            Spacer()
            VStack {
                HStack {
                    Text("Latitude:")
                    Spacer()
                    Text(String(coordinate?.latitude ?? 0))
                }
                HStack{
                    Text("Longitude:")
                    Spacer()
                    Text(String(coordinate?.longitude ?? 0))
                }
                if (locationViewModel.lastSeenLocation?.altitude != 0.0) {
                    HStack{
                        Text("Altitude")
                        Spacer()
                        let altitude2 = locationViewModel.lastSeenLocation?.altitude ?? 0.0
                        Text(String(altitude2))
                    }
                }
                
                if (locationViewModel.lastSeenLocation?.speed != 0) {
                    HStack{
                        Text("Speed")
                        Spacer()
                        Text(String(locationViewModel.lastSeenLocation?.speed ?? 0))
                    }
                }
                
                HStack{
                    Text("Country: ")
                    Spacer()
                    Text(String(locationViewModel.currentPlacemark?.country ?? ""))
                }
                HStack{
                    Text("State: ")
                    Spacer()
                    Text(String(locationViewModel.currentPlacemark?.administrativeArea ?? ""))
                }
                HStack {
                    Text("Sub Administrative Area: ")
                    Spacer()
                    Text(String(locationViewModel.currentPlacemark?.subAdministrativeArea ?? ""))
                }
                
//                HStack {
//                    Text(String(locationViewModel.currentPlacemark?.inlandWater ?? ""))
//                }
//                HStack {
//                    Text("Postal Address: ")
//                    Spacer()
//                    Text(String(locationViewModel.currentPlacemark?.postalAddress ?? ""))
//                }
                
                if (locationViewModel.currentPlacemark?.name != "") {
                    HStack{
                        Text("Place Name: ")
                        Spacer()
                        Text(String(locationViewModel.currentPlacemark?.name ?? ""))
                    }
                }
                if (locationViewModel.currentPlacemark?.locality != "" ) {
                    HStack{
                        Text("City: ")
                        Spacer()
                        Text(String(locationViewModel.currentPlacemark?.locality ?? ""))
                    }
                }
                if (locationViewModel.currentPlacemark?.subLocality != "") {
                    HStack{
                        Text("Neighborhood")
                        Spacer()
                        Text(String(locationViewModel.currentPlacemark?.subLocality ?? ""))
                    }
                }
            }
            VStack {
                HStack {
                    Text("Ocean: ")
                    Spacer()
                    Text(String(locationViewModel.currentPlacemark?.ocean ?? ""))
                }
                HStack {
                    Text("Inland Water: ")
                    Spacer()
                    Text(String(locationViewModel.currentPlacemark?.inlandWater ?? ""))
                }
                HStack{
                    Text("Sub Thoroughfare: ")
                    Spacer()
                    Text(String(locationViewModel.currentPlacemark?.subThoroughfare ?? ""))
                    //print(locationViewModel.currentPlacemark?.areasOfInterest)
                }
                HStack{
                    Text("Thoroughfare: ")
                    Spacer()
                    Text(String(locationViewModel.currentPlacemark?.thoroughfare ?? ""))
                }
                HStack{
                    Text("Area of Interest: ")
                    Spacer()
                    if locationViewModel.currentPlacemark?.areasOfInterest?.count ?? 0 > 0 {
                        let areaOfInterest = locationViewModel.currentPlacemark!.areasOfInterest![0]
                        Text(areaOfInterest)
                    } else {
                        Text("No area of interest found.")
                    }
                }
            }
            Spacer()
//            ZStack (alignment: .leading){
//                if notes.isEmpty {
//                    Text("Notes on Event")
//                        .opacity(0.25)
//                }
//                TextEditor(text: $notes)
//            }
                
            VStack {
                HStack {
                    Button {
                        let inlandWaterRecord = locationViewModel.currentPlacemark?.inlandWater ?? ""
                        let speedRecord = locationViewModel.lastSeenLocation?.speed ?? 0
                        let oceanRecord = locationViewModel.currentPlacemark?.ocean ?? ""
                        var areaOfInterestRecord: [String]
                        let subAdministrativeArea = locationViewModel.currentPlacemark?.subAdministrativeArea ?? ""
                        let altitudeRecord = locationViewModel.lastSeenLocation?.altitude ?? 0.0
                        let latitudeRecord = coordinate?.latitude ?? 0.0
                        let longitudeRecord = coordinate?.longitude ?? 0.0
                        let neighborhoodRecord = locationViewModel.currentPlacemark?.subLocality ?? ""
                        let subThuroughfareRecord = locationViewModel.currentPlacemark?.subThoroughfare ?? ""
                        let thoroughfareRecord = locationViewModel.currentPlacemark?.thoroughfare ?? ""
                        let cityRecord = locationViewModel.currentPlacemark?.locality ?? ""
                        let stateRecord = locationViewModel.currentPlacemark?.administrativeArea ?? ""
                        let countryRecord = locationViewModel.currentPlacemark?.country ?? ""
//                        let postalAddress = locationViewModel.currentPlacemark?.postalAddress ?? ""
                        if locationViewModel.currentPlacemark?.areasOfInterest?.count ?? 0 > 0 {
                            areaOfInterestRecord = locationViewModel.currentPlacemark!.areasOfInterest!
                        } else {
                            areaOfInterestRecord = [""]
                        }
                        //                        if locationViewModel.currentPlacemark?.areasOfInterest?.count ?? 0 > 0 {
                        //                            let areaOfInterest = locationViewModel.currentPlacemark!.areasOfInterest![0]

                        
                       
//                        if locationViewModel.currentPlacemark?.areasOfInterest?.count ?? 0 > 0 {
//                            let areaOfInterest = locationViewModel.currentPlacemark!.areasOfInterest![0]
//                            //Text(areaOfInterest)
//                        }
                        //let areaOfInterestRecord =
                        
                        
                        let newEvent = EventRecord(scale: 10, notes: notes, latitude: latitudeRecord, longitude: longitudeRecord, locationBool: true, speed: speedRecord, city: cityRecord, neighborhood: neighborhoodRecord, subThuroughfare: subThuroughfareRecord, thoroughfare: thoroughfareRecord, altitude: altitudeRecord, state: stateRecord, country: countryRecord, areaOfInterest: areaOfInterestRecord, subAdministrativeArea: subAdministrativeArea, ocean: oceanRecord, inlandWater: inlandWaterRecord)
                        
                        eventRecord.insert(newEvent, at: 0)
                        eventRecordedPopup = true
                        
                        //let newEvent = EventRecord(scale: scale, eventType: eventType, notes: notes, latitude: latitude, longitude: longitude, locationBool: includeLocation, customDate: customDate, customDateBool: showCustomTime)
                       
//                        feedback.notificationOccurred(.error)
//                        eventRecordedPopup = true
                    } label: {
                        HStack {
                            Spacer()
                            VStack (alignment: .center){
                                Text("Record").bold()
                                Text("Event").bold()
                                
                            }
                            Spacer()
                            Image(systemName: "plus.diamond.fill")
                                .font(.system(size: 45))
                                //.padding(2)
                            Spacer()
                        }
                        
                        .foregroundColor(.white)
                        .font(.system(size: 37))
                        .padding(8)
                        .padding([.bottom, .top], 15)
                        .background(.blue)
                        .cornerRadius(20)
                    }
                }
                .padding([.bottom], 10)
                .padding([.top], 5)
                .padding([.leading,.trailing], 50)
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    showingExporter = true;
                } label: {
                    Image(systemName: "square.and.arrow.up.circle")
                }
            }
        }
//        .fileExporter(isPresented: $showingExporter, document: yourDocument, contentType: .plainText) { result in
//            switch result {
//            case .success(let url):
//                print("Saved to \(url)")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        .alert("You have recorded an event.", isPresented: $eventRecordedPopup, actions: {})
    }
}

struct Previews_TrackingView_Previews: PreviewProvider {
   // @StateObject var locationViewModel = LocationViewModel()
    static var previews: some View {
        
        //TrackingView()
            //.environmentObject(<#_#>)
        Text("Hello, World!")
    }
}
