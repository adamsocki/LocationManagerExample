//
//  RecordedEventListView.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 7/9/22.
//

import SwiftUI

struct RecordedEventListView: View {
    @Binding var eventRecords: [EventRecord]
    var body: some View {
        List {
            ForEach($eventRecords) { $event in
                NavigationLink(destination: SpecificEventDetailsView(eventRecord: $event)) {
                    VStack (alignment: .leading) {
                        Text(event.thoroughfare)
                        Text(event.neighborhood)
                        
                    }
                    
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        //showDeleteAlert = true
                        eventRecords.removeAll(where: {event == $0})
                        //event.removeAll(where: { event == $0 })
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                }
            }
        }
    }
}

struct RecordedEventListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordedEventListView(eventRecords: .constant(EventRecord.sampleData))
    }
}
