//
//  UserTableViewCell.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/31/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  
  @IBOutlet private weak var userIDLbl: UILabel!
  @IBOutlet private weak var userNameLbl: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
}

extension UserTableViewCell {
  func setUser(_ user: User?) {
    userIDLbl.text = "ID: \(user?.userId ?? 0)"
    userNameLbl.text = user?.name
  }
}
