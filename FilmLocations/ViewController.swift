//
//  ViewController.swift
//  FilmLocations
//
//  Created by Angelina Olmedo on 4/16/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var films:[FilmEntry] = []
    
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 100
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
            print(url)
            
            let contents = try? Data(contentsOf: url)
            do {
                if let data = contents,
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:Any]] {
                print(jsonResult)
                for film in jsonResult{
                    let firstActor = film["actor_1"] as? String ?? ""
                    let locations = film["locations"] as? String  ?? ""
                    let releaseYear = film["release_year"] as? String  ?? ""
                    let title = film["title"] as? String  ?? ""
                    let movie = FilmEntry(firstActor: firstActor, locations: locations, releaseYear: releaseYear, title: title)
                    
                    films.append(movie)
                }
            }
            } catch {
                print("Error deserializing JSON: \(error)")
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
