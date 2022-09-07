//
//  HeaderView.swift
//  MVPTemplateProject
//
//  Created by Lazyman on 9/8/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import SwiftUI
 
struct HeaderView: View {
    var body: some View {
        ZStack {
            Color.red
            HStack {
                Button(action: {
                    print("Menu Button Tapped")
                }) {
                    Image(systemName: "menucard.fill") // image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                
                Text("My Tasks").foregroundColor(Color.white)
                    .font(Font.caption).bold()
                
                Spacer()
                Button(action: {
                    print("Search Button Tapped")
                }) {
                    Image(systemName: "magnifyingglass") // image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.white)
                }
            }.padding()
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      HeaderView()
        .previewLayout(.sizeThatFits)
    }
}
