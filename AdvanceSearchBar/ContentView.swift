//
//  ContentView.swift
//  AdvanceSearchBar
//
//  Created by Daichi Morihara on 2022/02/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var singers: FetchedResults<Singer>
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var searchText = ""
    
    enum KeyValue: String {
        case firstName
        case lastName
    }
    
    enum OperatioinValue: String {
        case BEGINSWITH = "BEGINSWITH[c]"
        case CONTAINS = "CONTAINS[c]"
        case LIKE = "LIKE[c]"
    }
    
    @State private var keyValue: KeyValue = .firstName
    @State private var operationValue: OperatioinValue = .BEGINSWITH
    
 
    
    
    var body: some View {
        VStack {
            
            Picker("KeyValue", selection: $keyValue) {
                Text("First Name")
                    .tag(KeyValue.firstName)
                Text("Last Name")
                    .tag(KeyValue.lastName)
            }
            .pickerStyle(.segmented)
            .padding()
            
            Picker("OperationValue", selection: $operationValue) {
                Text("BeginsWfith").tag(OperatioinValue.BEGINSWITH)
                Text("Contains").tag(OperatioinValue.CONTAINS)
                Text("Like").tag(OperatioinValue.LIKE)
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                VStack {
                    TextField("first name", text: $firstName)
                    TextField("last name", text: $lastName)
                }
                Button {
                    let singer = Singer(context: moc)
                    singer.firstName = firstName
                    singer.lastName = lastName
                    try? moc.save()
                    self.firstName = ""
                    self.lastName = ""
                } label: {
                    Text("Add")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                }
                .disabled(firstName.isEmpty || lastName.isEmpty)

            }
            .padding()
            
            TextField("Singer here", text: $searchText)
                .textInputAutocapitalization(.never)
                .padding()
            
            
            ScrollView {
                if searchText.isEmpty {
                    ForEach(singers, id: \.self) { singer in
                        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                    }
                } else {
                    SearchResult(keyValue: keyValue.rawValue, operation: operationValue.rawValue, searchText: searchText)
        //            SearchResult(searchText: searchText)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
