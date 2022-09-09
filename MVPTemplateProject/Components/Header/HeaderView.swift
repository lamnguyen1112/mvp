//
//  HeaderView.swift
//  MVPTemplateProject
//
//  Created by Lazyman on 9/8/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
  var title: String = ""
  var leftHandler: (() -> Void)?
  var rightHandler: (() -> Void)?

  var body: some View {
    ZStack {
      Color(UIColor.red)
      HStack {
        leftButton
        Spacer()
        titleView
        Spacer()
        rightButton
      }.padding()
    }
    .padding(.top, UIDevice.safeAreaInsets.top)
  }

  private var leftButton: some View {
    Button(action: {
      leftHandler?()
    }) {
      Image(systemName: "menucard.fill") // image name
        .resizable()
        .scaledToFit()
        .frame(width: 20, height: 20)
        .foregroundColor(Color.white)
    }
  }

  private var titleView: some View {
    Text(title).foregroundColor(Color.white)
      .font(Font.title3).bold()
  }

  private var rightButton: some View {
    Button(action: {
      rightHandler?()
    }) {
      Image(systemName: "magnifyingglass") // image name
        .resizable()
        .scaledToFit()
        .frame(width: 20, height: 20)
        .foregroundColor(Color.white)
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
      .previewLayout(.sizeThatFits)
  }
}
