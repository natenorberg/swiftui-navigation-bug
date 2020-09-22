//
//  ContentView.swift
//  NavigationBug
//
//  Created by Nate Norberg on 8/27/20.
//  Copyright © 2020 Quiq. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
  let dateFormatter = DateFormatter()
  dateFormatter.dateStyle = .medium
  dateFormatter.timeStyle = .medium
  return dateFormatter
}()

enum InstrumentType: String {
  case stringed
  case wind
}

struct ContentView: View {
  @EnvironmentObject var instruments: Instruments
  @EnvironmentObject var nav: Navigation
  
  var body: some View {
    NavigationView {
      VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
        Button(action: {
          self.nav.selectedInstrumentType = .stringed
          self.nav.selectedInstrument = "violin"
        }, label: {
          Text("Go to Violin")
        })
        Button(action: {
          self.nav.selectedInstrumentType = .stringed
          
          DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.75,
            execute: {
            self.nav.selectedInstrument = "violin"
          })
          
        }, label: {
          Text("Go to Violin (staggered)")
        })
        List {
          NavigationLink(
            destination: InstrumentList(instruments: self.$instruments.stringedInstruments),
            tag: .stringed,
            selection: self.$nav.selectedInstrumentType
          ) {
            Text("String Section")
          }
          NavigationLink(
            destination: InstrumentList(instruments: self.$instruments.windInstruments),
            tag: .wind,
            selection: self.$nav.selectedInstrumentType
          ) {
            Text("Wind Section")
          }
        }
      }
      
    }.navigationViewStyle(DoubleColumnNavigationViewStyle())
  }
}

struct InstrumentList: View {
  @EnvironmentObject var nav: Navigation
  
  @Binding var instruments: [Instrument]
  
  var body: some View {
    List {
      ForEach(instruments, id: \.id) { instrument in
        NavigationLink(
          destination: DetailView(instrument: instrument),
          tag: instrument.id,
          selection: self.$nav.selectedInstrument
        ) {
          Text(instrument.label)
        }
      }
    }
  }
}

struct DetailView: View {
  var instrument: Instrument?
  
  var moreDetailsButton: some View {
    NavigationLink(destination: MoreDetails()) {
      Image(systemName: "info.circle.fill")
        .imageScale(.large)
        .padding()
    }
  }
  
  var body: some View {
    VStack {
      Text(instrument?.label ?? "")
        .navigationBarTitle(Text("Detail"))
    }
    .navigationBarTitle(Text("More details"))
    .navigationBarItems(trailing: moreDetailsButton)
  }
}

struct MoreDetails: View {
  var body: some View {
    Text("Here's more details")
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
