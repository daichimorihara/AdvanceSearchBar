//
//  SearchResult.swift
//  AdvanceSearchBar
//
//  Created by Daichi Morihara on 2022/02/24.
//

import SwiftUI

struct SearchResult: View {
    
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
//    init(searchText: String) {
//        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "firstName BEGINSWITH %@", searchText))
//    }
    init(keyValue: String, operation: String, searchText: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(operation) %@", keyValue, searchText))
    }
    
    var body: some View {
        ForEach(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}

//struct SearchResult_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResult()
//    }
//}
