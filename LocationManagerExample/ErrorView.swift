//
//  ErrorView.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 6/6/22.
//

import Foundation
import SwiftUI


struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        VStack{
            Image(systemName:  "xmark.octagon")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(errorText)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
    }
    
}
