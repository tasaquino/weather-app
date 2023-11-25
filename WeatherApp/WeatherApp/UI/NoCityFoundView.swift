//
//  NoCityFoundView.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import SwiftUI

struct NoCityFoundView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("No city found :(").font(.title2)
        }.padding()
    }
}

#Preview {
    NoCityFoundView()
}
