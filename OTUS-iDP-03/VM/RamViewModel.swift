//
//  RamViewModel.swift
//  OTUS-iDP-03
//
//  Created by Igor Andryushenko on 14.04.2021.
//


import Foundation
import NetworkingRAM

extension Char: Identifiable {
    public var id: String {
        url
    }
}

extension Episode: Identifiable {
    public var id: String {
        url
    }
}

struct ClickedEpi: Identifiable {
    let id = UUID()
    let name: String
}

final class RamViewModel: ObservableObject {
    
    @Published private(set) var itemsChar: [Char] = [Char]()
    @Published private(set) var itemsEpi: [Episode] = [Episode]()
    @Published private(set) var clicksEpi: [ClickedEpi] = [ClickedEpi]()
    @Published private(set) var pageChar: Int = 0
    @Published private(set) var pageEpi: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    @Published var type: Int = 0
    let locator = ServiceLocator.shared
    
        
    init() {}
    
    func loadPage() {
        getClickedEpisodesList()
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
       
        
        if type == 0 {
            pageChar += 1
            RamAPI.getChars(page: pageChar){ response, error in
                if let results = response?.results {
                    self.itemsChar.append(contentsOf: results)
                }
                self.isPageLoading = false
            }
        } else if type == 1 {
            pageEpi += 1
            RamAPI.getEpisodes(page: pageEpi){ response, error in
                if let results = response?.results {
                    self.itemsEpi.append(contentsOf: results)
                }
                self.isPageLoading = false
            }
        } else if type == 2 {
            getClickedEpisodesList()
        }
    }
    
    func saveClickedEpisodes(item: Episode){
        let click: Click = locator.getService()
        click.addNew(name: item.name ?? "")
        print(click.getAll().count)
    }
    
    func getClickedEpisodesList(){
        clicksEpi.removeAll()
        let click: Click = locator.getService()
        let epiInfoList = click.getAll()
        for epiInfo in epiInfoList {
            self.clicksEpi.append(ClickedEpi(name: epiInfo))
        }
    }
}


