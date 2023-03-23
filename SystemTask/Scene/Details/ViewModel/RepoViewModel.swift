//
//  RepoViewModel.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 23/03/2023.
//

import Foundation

struct RepoViewModel {
    fileprivate let repo: RepoModel
    var exPandable : Bool =  false
    var name: String {
        return repo.name ?? ""
    }
    var image: String {
        return repo.owner?.avatarURL ?? ""
    }
   
}
