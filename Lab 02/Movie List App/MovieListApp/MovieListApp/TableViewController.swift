import UIKit

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
        
        let m1 = Movie();
        m1.title = "Harry Potter";
        m1.rating = 10.0;
        m1.releaseDate = 2000;
        m1.genre = ["action","fantasy"];
        m1.image = "harry";
        
        let m2 = Movie();
        m2.title = "Lion King";
        m2.rating = 9.5;
        m2.releaseDate = 1993;
        m2.genre = ["action","fantasy"];
        m2.image = "lion";
        
        let m3 = Movie();
        m3.title = "frozen";
        m3.rating = 9.0;
        m3.releaseDate = 2015;
        m3.genre = ["action","fantasy"];
        m3.image = "frozen";
        
        let m4 = Movie();
        m4.title = "Tangled";
        m4.rating = 10.0;
        m4.releaseDate = 2013;
        m4.genre = ["action","fantasy"];
        m4.image = "tangled";
        
        let m5 = Movie();
        m5.title = "Cars3";
        m5.rating = 8.0;
        m5.releaseDate = 2017;
        m5.genre = ["action","fantasy"];
        m5.image = "cars";
        
        movies = [m1,m2,m3,m4,m5];
        
        viewController = ViewController();
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
        cell.textLabel?.text = movies[indexPath.row].title;
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  movieIndex = indexPath.row;
    }
    
}
