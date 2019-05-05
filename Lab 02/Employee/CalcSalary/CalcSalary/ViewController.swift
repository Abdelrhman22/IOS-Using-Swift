import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var empLabel: UILabel!       // emp      Label
    @IBOutlet weak var managLabel: UILabel!    //  Manager  Label
    @IBOutlet weak var salaryTF: UITextField! //   TextField
    
    @IBAction func empButton(_ sender: UIButton)
    {
        let salStr = salaryTF.text!
        //var sall = Double(salStr)
        //var emp = Employee(sal: sall)
        //var output = emp.getSalary()
        print("Emp Sal ",salStr)
    }
    @IBAction func managerButton(_ sender: UIButton)
    {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

