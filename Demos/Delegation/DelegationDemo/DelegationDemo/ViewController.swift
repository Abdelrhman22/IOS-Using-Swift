import UIKit

class ViewController: UIViewController ,ClearProtocol{

    @IBOutlet weak var nameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondView = segue.destination as! SecondViewController
        secondView.firstVC = self
        secondView.str = nameTF.text!
    }
    func clear()
    {
        nameTF.text = ""
    }
}

