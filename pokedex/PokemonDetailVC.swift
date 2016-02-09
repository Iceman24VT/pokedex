//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Thomas Hartka on 2/8/16.
//  Copyright © 2016 UVA. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nexEvoImg: UIImageView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done
            self.updateUI()
        }
    }
    
    func updateUI(){
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nexEvoImg.hidden = true
        } else {
            nexEvoImg.hidden = false
            nexEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            
            evoLbl.text = str 
        }
    }

    @IBAction func musicBtnPressed(sender: UIButton!) {
        //let parentVC = self.parentViewController as! ViewController
        //parentVC.musicToggle(sender)
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
