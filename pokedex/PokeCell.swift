//
//  PokeCell.swift
//  pokedex
//
//  Created by Thomas Hartka on 2/8/16.
//  Copyright © 2016 UVA. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    private var _pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self._pokemon = pokemon
        
        nameLbl.text = _pokemon.name.capitalizedString
        thumbImage.image = UIImage(named: "\(_pokemon.pokedexId)")
    }
}
