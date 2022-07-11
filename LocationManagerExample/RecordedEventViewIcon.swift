//
//  RecordedEventViewIcon.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 7/9/22.
//

import SwiftUI

struct RecordedEventViewIcon: View {
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading){
                    Text("List of Recorded Events")
                        .font(.title2)
                        .bold()
                    Text("Select to view list")
                }
                Spacer()
                Image(systemName: "list.bullet.rectangle.portrait")
                    .font(.system(size: 40))
                
            }
            .padding()
        }
        .foregroundStyle(.black)
        .background(.gray)
        .cornerRadius(20)
        
    }
    
}

struct RecordedEventViewIcon_Previews: PreviewProvider {
    static var previews: some View {
        RecordedEventViewIcon()
    }
}
