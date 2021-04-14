//
//  RamScreen.swift
//  OTUS-iDP-03
//
//  Created by Igor Andryushenko on 14.04.2021.
//

import SwiftUI
import UIComponents
import NetworkingRAM


struct RaMScreen: View {
    @EnvironmentObject var ramViewModel: RamViewModel
    
    
    var body: some View {
        LazyView{
            NavigationView {
                List {
                    Section(header: Text("RickandmortyAPI")) {
                        if ramViewModel.type == 0{
                            ForEach(ramViewModel.itemsChar) { char in
                                NavPushButton(destination: LazyView(CharacterDetailScreen(item: char))) {
                                    RamCell(title: char.name.asStringOrEmpty,
                                               text: char.status.asStringOrEmpty,
                                               statusIsLoading: ramViewModel.isPageLoading,
                                               statusIsLast: ramViewModel.itemsChar.isLast(char))
                                        .onAppear() {
                                            if ramViewModel.itemsChar.isLast(char) {
                                                ramViewModel.loadPage()
                                            }
                                        }
                                }
                            }
                        } else if ramViewModel.type == 1 {
                            ForEach(ramViewModel.itemsEpi) { epi in
                                Button(action: {
                                    ramViewModel.saveClickedEpisodes(item: epi)
                                }) {
                                    RamCell(title: epi.name.asStringOrEmpty,
                                               text: epi.episode.asStringOrEmpty,
                                               statusIsLoading: ramViewModel.isPageLoading,
                                               statusIsLast: ramViewModel.itemsEpi.isLast(epi))
                                        .onAppear() {
                                            if ramViewModel.itemsEpi.isLast(epi) {
                                                ramViewModel.loadPage()
                                            }
                                        }
                                }
                                
                            }
                        }
                        else if ramViewModel.type == 2 {
                            ForEach(ramViewModel.clicksEpi) { cEpi in
                                Text(cEpi.name)
                            }
                        }
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                .onAppear() {
                    ramViewModel.loadPage()
                }
            }
        }
        
    }
    
}

//struct RaMScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        RaMScreen()
//    }
//}
