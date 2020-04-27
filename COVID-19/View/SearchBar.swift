//
//  SummarySearchBar.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/19/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var query: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var query: String
        
        init(query: Binding<String>) {
            _query = query
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            query = searchText
        }
        
        func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
            searchBar.searchTextField.endEditing(true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(query: $query)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = query
    }
}

struct SearchBar_Previews: PreviewProvider {
    struct WithQuery: View {
        @State var query = "united "
        var body: some View {
            SearchBar(query: $query)
        }
    }
    static var previews: some View {
        Group {
            NavigationView {
                List {
                    WithQuery()
                }
            }
        }
    }
}
