//
//  SeriesViewController.swift
//  Series
//
//  Created by Álvaro Sanz Rodrigo on 3/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class SeriesViewController: UIViewController {
    
    internal var series: [Serie] = []
    internal var indexCurrentSerie = 0

    @IBOutlet weak var backgroundBlurImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var serieTitle: UILabel!
    @IBOutlet weak var serieDescriptionTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Series"
        setupBarButtonsItems()
        nextButton.layer.cornerRadius = 5
        previousButton.layer.cornerRadius = 5
        loadAllSeries()
        refreshUIWithSerie(serie: series[indexCurrentSerie])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setupBarButtonsItems(){
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        navigationItem.setLeftBarButton(cancelBarButton, animated: false)
        
        let actorsBarButton = UIBarButtonItem(title: "Actores", style: .plain, target: self, action: #selector(actorsPressed))
        navigationItem.setRightBarButton(actorsBarButton, animated: false)
        
    }
    
    @objc private func cancelPressed(){
        dismiss(animated: true, completion: nil)
    }
    @objc private func actorsPressed(){
        let actoresVC = ActoresViewController(actors: series[indexCurrentSerie].actors)
        navigationController?.pushViewController(actoresVC, animated: true)
        
    }
    
    private func loadAllSeries(){
        let breakingBad = Serie(name: "Breaking Bad", imageFile: "breaking", summary: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", seasons: 5,actors: [])
        let betterCallSaul = Serie(name: "Better Call Saul", imageFile: "saul", summary: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", seasons: 3, actors: [])
        let emilia = Actors(name: "Emilia Clarke", avatar: "https://pbs.twimg.com/profile_images/670285916758548481/Caum_0Rq_400x400.jpg")
        let peter = Actors(name: "Peter Dinklage", avatar: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTE5NTU2MzE2NTMzMzI3Mzcx/peter-dinklage-20787107-1-402.jpg")
        let actores = [emilia, peter]
        let gameOfTrhones = Serie(name: "Game Of Trhones", imageFile: "thrones", summary: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", seasons: 7, actors: actores)
        
        series.append(breakingBad)
        series.append(betterCallSaul)
        series.append(gameOfTrhones)
        
    }
    
    private func refreshUIWithSerie(serie : Serie){
        mainImageView.image = UIImage(named: serie.imageFile)
        backgroundBlurImageView.image = UIImage(named: serie.imageFile)
        serieTitle.text = serie.name
        serieDescriptionTextView.text = serie.summary
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        indexCurrentSerie = (indexCurrentSerie + 1) % series.count
        refreshUIWithSerie(serie: series[indexCurrentSerie])
    }
    @IBAction func previousButtonAction(_ sender: UIButton) {
        indexCurrentSerie = ((indexCurrentSerie + series.count-1) % series.count)
        refreshUIWithSerie(serie: series[indexCurrentSerie])
    }
    
    

}
