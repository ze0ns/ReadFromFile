//
//  TableViewController.swift
//  ReadFromFile
//
//  Created by zeons on 28.03.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var textArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
            readFromFile()
    }
    func readFromFile (){
        if let  path = Bundle.main.path(forResource: "text", ofType: "txt"){
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n\n")
                print(#line, #function, textArray)
            }
        }

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return textArray.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "Cell number \(indexPath.row)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
            let dvc = segue.destination as! ViewController
            dvc.text =  textArray[indexPath.row]
            }
        }
    }
}
