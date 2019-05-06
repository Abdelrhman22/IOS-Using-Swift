//
//  ViewController.swift
//  FetchOnlineMovies
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var ratingField: UILabel!
    @IBOutlet weak var yearField: UILabel!
    @IBOutlet weak var genreField: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var movie : Movie = Movie();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = movie.title;
        ratingField.text = String(movie.rating);
        yearField.text = String(movie.releaseDate);
        genreField.text="";
        for x in 0..<(movie.genre?.count)!{
            genreField.text.append((movie.genre?[x])!);
            genreField.text.append("\n");
        }
        imageView.image = UIImage(named : movie.image+".jpg");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMovie( mov : Movie )
    {
        movie = mov;
    }
}

