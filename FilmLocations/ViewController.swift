//
//  ViewController.swift
//  FilmLocations
//
//  Created by Angelina Olmedo on 4/16/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var films:[FilmEntryCodable] = []
    
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 200
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getDataFromFile("locations")
        tableView.register(
                    MovieCell.nib,
                    forCellReuseIdentifier: MovieCell.identifier
        )
    }
    
    func getDataFromFile(_ fileName:String){
        let path = Bundle.main.path(forResource: fileName, ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let contents = try? Data(contentsOf: url)
            if let data = contents{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let filmsFromJSON = try decoder.decode([FilmEntryCodable].self, from: data)
                    films = filmsFromJSON
                    tableView.reloadData()
                } catch {
                    print("Parsing Failed")
                }
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let film = films[indexPath.row]
        cell.configure(film)
        return cell
    }
}

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
