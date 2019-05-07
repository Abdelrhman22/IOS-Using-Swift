import UIKit
import CoreData
class TableViewController: UITableViewController , MoviesTableProtocol{
    
    @IBAction func addbtn(_ sender: Any)
    {
        print("Add Clickded")
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "addView") as! AddViewController
        addView.myProtocol = self
        self.navigationController?.pushViewController(addView, animated: true)
    }
    //var movies : [Movie]!;
    var movies : [NSManagedObject]!;
    var viewController : ViewController!;
    //var movieIndex = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        viewController = ViewController();
        //getMovies()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        
        let managedConetext = appDeleget.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        do{
            movies = try managedConetext.fetch(fetchRequest)
        }catch{
            print("error")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = (movies[indexPath.row].value(forKey: "title") as! String);
        //cell.imageView?.image=UIImage(named: movies[indexPath.row].image)
        return cell
    }
    func addMovie(movie : Movie)
    {
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let managedConetext = appDeleget.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movies",in: managedConetext)
        let coreMovie = NSManagedObject(entity: entity!,insertInto: managedConetext)
        coreMovie.setValue(movie.title , forKey: "title")
        coreMovie.setValue(movie.image , forKey: "image")
        coreMovie.setValue(movie.releaseDate , forKey: "year")
        coreMovie.setValue(movie.rating , forKey: "rating")
        coreMovie.setValue(movie.genre , forKey: "genre")
        do{
            try managedConetext.save()
            print("movie saved")
        }catch let error as NSError{
            print(error)
        }
        movies.append(coreMovie)
        self.tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        viewController = segue.destination as? ViewController;
        
        let myMovie: Movie = Movie()
        myMovie.title = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "title") as! String
        myMovie.image = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "image") as! String
        myMovie.rating = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "rating") as! Float
        myMovie.releaseDate = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "year") as! Int
        myMovie.genre = (movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "genre") as! [String])
        
        viewController.setMovie(mov: myMovie);
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  movieIndex = indexPath.row;
    }
    /*
    func getMovies(){
        
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest (url: url!)
        let session = URLSession( configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                var json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                for index in 0..<json.count{
                    var object = json[index]
                    let movieObject = Movie()
                    movieObject.title = object["title"]! as! String
                    movieObject.rating = (object["rating"] as? NSNumber)?.floatValue ?? 0
                    //object["rating"]! as! Float
                    movieObject.releaseDate = object["releaseYear"]! as! Int
                    movieObject.genre = (object["genre"]! as! [String])
                    movieObject.image = object["image"]! as! String
                    
                    self.movies?.append(movieObject)
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
 */
}
