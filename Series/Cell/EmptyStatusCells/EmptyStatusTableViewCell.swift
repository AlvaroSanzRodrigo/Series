//
//  EmptyStatusTableViewCell.swift
//  Series
//
//  Created by Álvaro Sanz Rodrigo on 10/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

protocol EmptyStatusTableViewCellDelegate: class {
    func emptyStatusCellDidPressBack(cell: EmptyStatusTableViewCell)
}

class EmptyStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    weak var delegate: EmptyStatusTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backButton.layer.cornerRadius = 3
        
        view.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func backPressed(_ sender: Any) {
        delegate?.emptyStatusCellDidPressBack(cell: self)
    }
    
}
