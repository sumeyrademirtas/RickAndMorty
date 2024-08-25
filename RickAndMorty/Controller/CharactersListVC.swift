//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 19.08.2024.
//

import UIKit
private let reuseIdentifier = "UserCell"


/// Controller to show the list of characters
class CharactersListVC: UIViewController {
    

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        title = "Characters"
     
        }
        
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CharacterListCell.self, forCellReuseIdentifier: CharacterListCell.identifier)
        return tableView
    }()
    
    // MARK: - configure TableView
    private func configureTableView() {
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(tableView)
        self.setTableViewDelegates()
        tableView.rowHeight = 72

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    // MARK: - TableView Delegate
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension CharactersListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCell.identifier, for: indexPath) as? CharacterListCell else {
            fatalError("The TableView could no dequeue a CustomCell in MainViewController")
        }
        
        let viewModel = RMCharacterListCellViewModel(
            characterName: "Sumeyra",
            characterStatus: .alive,
            characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))

        cell.configure(with: viewModel)
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG: PRINT:", indexPath.row)
    }
    
    
    
}


