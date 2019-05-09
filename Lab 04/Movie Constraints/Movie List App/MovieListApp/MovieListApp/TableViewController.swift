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
    var movies : [Movie]!;
    var viewController : ViewController!;
    //var movieIndex = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        viewController = ViewController();
        movies = []
        /*
         let movie1 = Movie();
         movie1.title = "Dawn of the Planet of the Apes";
         movie1.rating = 8.3;
         movie1.releaseDate = 2014;
         movie1.genre = ["Action","Drama" , "Sci-Fi"];
         movie1.image = "dawn";
         
         let movie2 = Movie();
         movie2.title = "District 9";
         movie2.rating = 8.0;
         movie2.releaseDate = 2009;
         movie2.genre = ["Action", "Sci-Fi", "Thriller"];
         movie2.image = "district";
         
         let movie3 = Movie();
         movie3.title = "Transformers: Age of Extinction";
         movie3.rating = 6.3;
         movie3.releaseDate = 2014;
         movie3.genre = ["action","fantasy"];
         movie3.image = "trans";
         
         let movie4 = Movie();
         movie4.title = "X-Men: Days of Future Past";
         movie4.rating = 10.0;
         movie4.releaseDate = 2013;
         movie4.genre = ["Action", "Sci-Fi", "Thriller"];
         movie4.image = "men";
         
         let movie5 = Movie();
         movie5.title = "The Machinist";
         movie5.rating = 8.0;
         movie5.releaseDate = 2017;
         movie5.genre = ["Drama", "Thriller"];
         movie5.image = "mach";
         
         movies = [movie1,movie2,movie3,movie4,movie5];
         */
        getMovies()
        
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
        cell.textLabel?.text = movies[indexPath.row].title
        //cell.imageView?.image=UIImage(named: movies[indexPath.row].image)
        return cell
    }
    func addMovie(movie : Movie)
    {
        movies?.append(movie)
        self.tableView.reloadData();
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        viewController = segue.destination as? ViewController;
        viewController.setMovie(mov: movies[(self.tableView.indexPathForSelectedRow?.row)!]);
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
}
