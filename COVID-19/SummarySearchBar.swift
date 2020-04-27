//
//  SummarySearchBar.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/19/20.
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
