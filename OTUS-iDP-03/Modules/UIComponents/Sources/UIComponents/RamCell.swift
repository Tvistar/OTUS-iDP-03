//
//  SwiftUIView.swift
//  
//
//  Created by Igor Andryushenko on 13.04.2021.
//

import SwiftUI

public struct RamCell: View{
    
    private let title: String
    private let text: String
    private let statusIsLoading: Bool
    private let statusIsLast: Bool
    
    public init(title: String, text: String, statusIsLoading: Bool, statusIsLast: Bool) {
        self.title = title
        self.text = text
        self.statusIsLoading = statusIsLoading
        self.statusIsLast = statusIsLast
    }
    
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Text(text)
                .font(.callout)
                .foregroundColor(.secondary)
            if statusIsLoading && statusIsLast {
                Divider()
                VStack (alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(maxWidth: .infinity)
            }
        } // VStack
    }
}




//struct RamCell_Previews: PreviewProvider {
//    static var previews: some View {
//        RamCell(title: "title", text: "text", statusIsLoading: true, statusIsLast: true)
//    }
//}
