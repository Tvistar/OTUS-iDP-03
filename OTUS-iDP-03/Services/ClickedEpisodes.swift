//
//  ClickedEpisodes.swift
//  OTUS-iDP-03
//
//  Created by Igor Andryushenko on 15.04.2021.
//

import Foundation


protocol Click {
    func clear()
    func addNew(name: String)
    func getAll() -> [String]
}

class ClickedEpisodes : Click {
    private (set) var info = EpiInfo()
    func clear() {
        self.info = EpiInfo()
    }
    func addNew(name: String) {
        self.info.nameList.append(name)
    }
    func getAll() -> [String] {
        return self.info.nameList
    }
}

struct EpiInfo {
    var nameList = [String]()
}
