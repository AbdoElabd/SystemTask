//
//  ContentView.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 21/03/2023.
//

import SwiftUI
import CoreData


struct HomeView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = HomeListViewController
    
    func makeUIViewController(context: Context) -> HomeListViewController {
        return UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeListViewController
    }
    
    func updateUIViewController(_ uiViewController: HomeListViewController, context: Context) {
        
    }
    

   
}




struct ContentView: View {
   

    var body: some View {
       HomeView()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
