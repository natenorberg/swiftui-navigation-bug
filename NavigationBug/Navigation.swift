//
//  Navigation.swift
//  NavigationBug
//
//  Created by Nate Norberg on 8/27/20.
//  Copyright © 2020 Quiq. All rights reserved.
//

import Foundation

class Navigation: ObservableObject {
  @Published var selectedInstrumentType: InstrumentType? = nil {
    willSet(newType) {
      print("Setting selected type to \(newType?.rawValue ?? "nil")")
    }
  }
  @Published var selectedInstrument: String? = nil {
    willSet(newInstrument) {
      print("Setting selected instrument to \(newInstrument ?? "nil")")
    }
  }
}
