//
//  SearchVC.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/17/22.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let tableView: UITableView = {
        let table  = UITableView()
        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        return table
    }()
    
    let searchCharacter = UISearchController(searchResultsController: nil)
    
    var results = [APIResponse]()
    
    var viewModels = [CharacterTableViewCellViewModel]()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            view.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
            view.backgroundColor = .systemBackground
            
            fetchAllCharacters()
            createSearchBar()
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func createSearchBar() {
        navigationItem.searchController = searchCharacter
        searchCharacter.searchBar.delegate = self
    }
    
    func fetchAllCharacters() {
        APICaller.shared.getAllCharacters { [weak self] result in
            switch result {
            case .success(let results):
                self?.viewModels = results.compactMap({
                    CharacterTableViewCellViewModel(name: $0.name,
                                                    status: $0.status,
                                                    species: $0.species,
                                                    gender: $0.gender,
                                                    image: $0.image,
                                                    imageURL: URL(string: $0.image)
                    )
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
    }

    
  
    
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //SearchBar Function
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        APICaller.shared.search(with: text){ [weak self] result in
            switch result {
            case .success(let results):
                self?.viewModels = results.compactMap({
                    CharacterTableViewCellViewModel(name: $0.name,
                                                    status: $0.status,
                                                    species: $0.species,
                                                    gender: $0.gender,
                                                    image: $0.image,
                                                    imageURL: URL(string: $0.image)
                    )
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
