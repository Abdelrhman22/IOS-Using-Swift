//
//  ViewController.swift
//  MovieListApp
//
//  Created by JETS Mobile Lab - 9 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
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
        
        print("did load");
        titleField.text = movie.title;
        ratingField.text = String(movie.rating);
        yearField.text = String(movie.releaseDate);
        genreField.text="";
        for x in 0..<(movie.genre?.count)!{
            genreField.text.append((movie.genre?[x])!);
            genreField.text.append("\n");
        }
        print("image "+movie.image);
        imageView.image = UIImage(named : movie.image+".jpg");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     
    func setMovie( mov : Movie ){
        print("setMovie\n");
        movie = mov;
        print(mov.title);
        print(movie.title);
        
        
    }
    
}



