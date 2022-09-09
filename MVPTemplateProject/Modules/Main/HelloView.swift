//
//  HelloView.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 8/6/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import SwiftUI

struct HelloView: View {
  var body: some View {
    VStack {
      Text("Hello, World!")
    }
    .background(Color(R.color.background()!))
  }
}

struct HelloView_Previews: PreviewProvider {
  static var previews: some View {
    HelloView()
  }
}
