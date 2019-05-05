import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var empLabel: UILabel!       // emp      Label
    @IBOutlet weak var managLabel: UILabel!    //  Manager  Label
    @IBOutlet weak var salaryTF: UITextField! //   TextField
    
    @IBAction func empButton(_ sender: UIButton)
    {
        let salStr = salaryTF.text!
        if(!salStr.isEmpty)
        { 
            let sall = Double(salStr)
            let emp = Employee(sal: sall!)
            let output = emp.getSalary()
            print("Emp Sal ",output)
            empLabel.text = String(output)
        }
        else{
            empLabel.text = "Empty Value !"
        }
    }
    @IBAction func managerButton(_ sender: UIButton)
    {
         let salStr = salaryTF.text!
        if(!salStr.isEmpty)
        {
            let sall = Double(salStr)
            let manag = Manager(sal: sall!)
            let output = manag.getSalary()
            print("Manag Sal ",output)
            managLabel.text = String(output)
        }
        else
        {
             managLabel.text = "Empty Value !"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

