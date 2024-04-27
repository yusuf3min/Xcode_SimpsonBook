//
//  ViewController.swift
//  MySimpsonBook
//
//  Created by yusufeminguney on 25.04.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons=[Simpson]()
    var chosenSimpson : Simpson?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homer=Simpson(name: "Hommer Simpson", job: "Nucklear Safety", image: UIImage.init(named: "homer")!)
        
        let marge=Simpson(name: "Marge Simpson", job: "Housewife", image: UIImage.init(named: "marge")!)
        
        let bart=Simpson(name: "Bart Simpson", job: "Student", image: UIImage.init(named: "bart")!)
        
        let lisa=Simpson(name: "Lisa Simpson", job: "Student", image: UIImage.init(named: "lisa")!)
        
        let maggie=Simpson(name: "Maggie Simpson", job: "Baby", image: UIImage.init(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        tableView.dataSource=self
        tableView.delegate=self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell()
        cell.textLabel?.text=mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
        
        
    }
    
}
