//
//  MovieCell.swift
//  FilmLocations
//
//  Created by Angelina Olmedo on 4/16/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ movie: FilmEntry) {
        self.nameLabel.text = movie.title
        }
    
        static var nib: UINib {
               return UINib(nibName: String(describing: self), bundle: nil)
        }
    
}
