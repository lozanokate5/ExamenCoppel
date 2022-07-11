//
//  PopularTableViewCell.swift
//  ExamQual
//
//  Created by catalina lozano on 09/07/22.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    @IBOutlet weak var estrellaImg: UIImageView!
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var fechaLbl: UILabel!
    
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var resumenLbl: UILabel!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
