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
        print(#line, #function, "Function is load")
            readFromFile()
    }
    
    func readFromFile (){
        if let  path = Bundle.main.path(forResource: "text", ofType: "txt"){
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n")
                print(#line, #function, "Loading file")
                print(#line, #function, textArray.count)
            }
        }

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#line, #function, textArray.count)
        return textArray.count
             }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        print(#line, #function, indexPath.row)
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
