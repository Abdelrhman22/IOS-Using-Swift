//
//  AddViewController.swift
//  MovieListApp
//
//  Created by JETS Mobile Lab - 9 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class AddViewController: UIViewController
{
    var myProtocol:MoviesTableProtocol?
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var imageTF: UITextField!
    @IBOutlet weak var ratingTF: UITextField!
    @IBOutlet weak var relaseTF: UITextField!
    @IBOutlet weak var genreTF: UITextField!
    
    @IBAction func addMovieButton(_ sender: UIButton)
    {
        let movie : Movie = Movie();
        movie.title = titleTF.text!;
        movie.image = imageTF.text!;
        movie.rating = Float(ratingTF.text!)!;
        movie.releaseDate = Int(relaseTF.text!)!;
        movie.genre = [genreTF.text!];
        
        myProtocol!.addMovie(movie: movie);
        
        self.navigationController?.popViewController(animated: true);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
