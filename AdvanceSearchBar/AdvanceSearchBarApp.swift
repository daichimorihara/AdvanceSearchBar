//
//  AdvanceSearchBarApp.swift
//  AdvanceSearchBar
//
//  Created by Daichi Morihara on 2022/02/24.
//

import SwiftUI

@main
struct AdvanceSearchBarApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
