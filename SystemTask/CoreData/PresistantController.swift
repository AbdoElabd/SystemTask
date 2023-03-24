//
//  PresistantController.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 23/03/2023.
//
import UIKit
import CoreData

class PreseistantController {
    static let shared = PreseistantController()
   
    let container : NSPersistentContainer
    init() {
        self.container = NSPersistentContainer(name: "ReposCore")
        container.loadPersistentStores { descrition, error in
            if let error = error {
                fatalError("Error : \(error.localizedDescription)")

            }
        }
    }
    func saveUserData(_ repos: Repos) {
        let context = container.viewContext
       
        //remove previous data
        let reposCore : [RepoCore] = self.fetchRepos() ?? []
        for repo in reposCore{
            context.delete(repo)
        }
        // then save it
        for repo in repos {
            let newRepo = NSEntityDescription.insertNewObject(forEntityName: "RepoCore", into: context)
            newRepo.setValue(repo.id, forKey: "id")
            newRepo.setValue(repo.name, forKey: "name")
        }
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
        
    }
    func fetchRepos() -> [RepoCore]? {
        let context = container.viewContext
        var repos : [RepoCore]? = nil
        do{
            try repos = context.fetch(RepoCore.fetchRequest())
            
             
        }
        catch(let error){
            print(error.localizedDescription)
        }
        return repos ?? []
    }
}

