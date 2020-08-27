//
//  Instruments.swift
//  NavigationBug
//
//  Created by Nate Norberg on 8/27/20.
//  Copyright © 2020 Quiq. All rights reserved.
//

import Foundation

class Instruments: ObservableObject {
  @Published var stringedInstruments: [Instrument] = [
    Instrument(id: "guitar", label: "Guitar"),
    Instrument(id: "bass", label: "Bass"),
    Instrument(id: "violin", label: "Violin"),
    Instrument(id: "viola", label: "Viola")
  ]
  @Published var windInstruments: [Instrument] = [
    Instrument(id: "trumpet", label: "Trumpet"),
    Instrument(id: "trombone", label: "Trombone"),
    Instrument(id: "sax", label: "Sax")
  ]
}

struct Instrument: Codable {
  var id: String
  var label: String
}
