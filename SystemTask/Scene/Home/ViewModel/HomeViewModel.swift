//
//  HomeViewModel.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 21/03/2023.
//

import Foundation

class HomeViewModel {
    
    private var repos: [RepoModel] = []
    var numberOfRepos: Int {
        return repos.count
    }
    func fetchReposFromCoreData(completion: @escaping () -> Void )  {
        repos = []
        let reposCore : [RepoCore] = PreseistantController().fetchRepos() ?? []
        if reposCore.count != 0{
            for repo in reposCore {
                let reboModel = RepoModel(id: Int(repo.id), nodeID: nil, name: repo.name, fullName: nil, ropoPrivate: true, owner: nil, htmlURL: nil, description: nil, fork: nil, url: "", forksURL: nil, keysURL: nil, collaboratorsURL: nil, teamsURL: nil, hooksURL: nil, issueEventsURL: nil, eventsURL: nil, assigneesURL: nil, branchesURL: nil, tagsURL: nil, blobsURL: nil, gitTagsURL: nil, gitRefsURL: nil, treesURL: nil, statusesURL: nil, languagesURL: nil, stargazersURL: nil, contributorsURL: nil, subscribersURL: nil, subscriptionURL: nil, commitsURL: nil, gitCommitsURL: nil, commentsURL: nil, issueCommentURL: nil, contentsURL: nil, compareURL: nil, mergesURL: nil, archiveURL: nil, downloadsURL: nil, issuesURL: nil, pullsURL: nil, milestonesURL: nil, notificationsURL: nil, labelsURL: nil, releasesURL: nil, deploymentsURL: nil, createdAt: nil, updatedAt: nil, pushedAt: nil, gitURL: nil, sshURL: nil, cloneURL: nil, svnURL: nil, homepage: nil, size: nil, stargazersCount: nil, watchersCount: nil, language: nil, hasIssues: nil, hasProjects: nil, hasDownloads: nil, hasWiki: nil, hasPages: nil, hasDiscussions: nil, forksCount: nil, mirrorURL: nil, archived: nil, disabled: nil, openIssuesCount: nil, license: nil, allowForking: nil, isTemplate: nil, webCommitSignoffRequired: nil, topics: nil, visibility: nil, forks: nil, openIssues: nil, watchers: nil, defaultBranch: nil)
                repos.append(reboModel)
                completion()
            }
        }
    }
    func fetchRepos(completion: @escaping () -> Void) {
        RepoAPI.shared.fetchRepos { [weak self] repos in
            self?.repos = repos
            PreseistantController().saveUserData(repos)
            completion()
        }
    }
    func repoAtIndex(_ index: Int) -> RepoViewModel {
        let repo = repos[index]
        return RepoViewModel(repo: repo)
    }
}

