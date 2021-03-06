import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var tableView: UITableView!
    var contents = [[String]]()
    var headers = [String]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let fruits = [ "Apple", "Banana", "Grape", "Melon" ]
        let vegetables = [ "Carrot", "Celery", "Asparagus" ]
        let sweets = [ "Chocolate", "Pie" ]
        
        contents = [ fruits, vegetables, sweets ]
        headers = [ "Fruits", "Vegetables", "Sweet" ]
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> String
    {
        let groupArray = contents[indexPath.section]
        let text = groupArray[indexPath.row]
        
        return text
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return contents.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return headers[section]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let groupArray = contents[section]
        
        return groupArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .Default, reuseIdentifier: "Plain")
        
        let text = itemAtIndexPath(indexPath)
        
        cell.textLabel?.text = text
        
        return cell;
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let text = itemAtIndexPath(indexPath)
        
        print(text)
    }
}

