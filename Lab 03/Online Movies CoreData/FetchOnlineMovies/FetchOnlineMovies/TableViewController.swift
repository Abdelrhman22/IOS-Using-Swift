import UIKit
import CoreData
import SDWebImage
class TableViewController: UITableViewController , MoviesTableProtocol{
    
    @IBAction func addbtn(_ sender: Any)
    {
        print("Add Clickded")
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "addView") as! AddViewController
        addView.myProtocol = self
        self.navigationController?.pushViewController(addView, animated: true)
    }
    var movies : [NSManagedObject]!;     // movies array  of type NSManagedObject to deal with CoreData
    var viewController : ViewController!;

    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewController = ViewController();
        getMovies()  // fetch movies online and Save them .
    }
    override func viewWillAppear(_ animated: Bool) // show saved movies , which fetched and saved from API
    {
        super.viewWillAppear(animated)
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let managedConetext = appDeleget.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        do
        {
            movies = try managedConetext.fetch(fetchRequest) // fetch
        }catch{
            print("viewWillAppear ...Error while fetching movies ")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = (movies[indexPath.row].value(forKey: "title") as! String);
        
        cell.imageView?.sd_setImage(with: URL(string: (movies[indexPath.row].value(forKey: "image") as! String)), placeholderImage: UIImage(named: "placeholder.jpg"))
        return cell
    }
    func addMovie(movie movieAdded : Movie)
    {
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let managedConetext = appDeleget.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movies",in: managedConetext)
        let movie = NSManagedObject(entity: entity!,insertInto: managedConetext)
        movie.setValue(movieAdded.title , forKey: "title")
        movie.setValue(movieAdded.image , forKey: "image")
        movie.setValue(movieAdded.releaseDate , forKey: "releaseDate")
        movie.setValue(movieAdded.rating , forKey: "rating")
        movie.setValue(movieAdded.genre , forKey: "genre")
        do
        {
            try managedConetext.save()
        }catch let error as NSError{
            print(error)
        }
        movies.append(movie)
        self.tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        viewController = segue.destination as? ViewController;
        
        let clickedMovie: Movie = Movie()
        clickedMovie.title = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "title") as! String
        clickedMovie.image = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "image") as! String
        clickedMovie.rating = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "rating") as! Float
        clickedMovie.releaseDate = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "releaseDate") as! Int
        clickedMovie.genre = (movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "genre") as! [String])
        
        viewController.setMovie(mov: clickedMovie);
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  movieIndex = indexPath.row;
    }
    
    func getMovies(){
        
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest (url: url!)
        let session = URLSession( configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                var json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                for index in 0..<json.count{
                    var object = json[index]
                    let appDeleget = UIApplication.shared.delegate as! AppDelegate
                    let managedConetext = appDeleget.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "Movies",in:managedConetext)
                    let movie = NSManagedObject(entity: entity!,insertInto: managedConetext)
                    movie.setValue(object["title"]! as! String , forKey: "title")
                    movie.setValue(object["image"]! as! String, forKey: "image")
                    movie.setValue(object["releaseYear"]! as! Int, forKey: "releaseDate")
                    movie.setValue((object["rating"] as? NSNumber)?.floatValue ?? 0 , forKey: "rating")
                    movie.setValue( (object["genre"]! as! [String]), forKey: "genre")
                    do{
                        try managedConetext.save()
                        print("Fetched new Movie",object["title"]! as! String)
                    }catch let error as NSError{
                        print(error)
                    }
                    self.movies.append(movie)
                    DispatchQueue.main.async
                    {
                       self.tableView.reloadData()
                    } // end of DispatchQueue
                } // end of for
            }
            catch
            {
                print("Error")
            }
        }
        task.resume()
        
    }
 
}
