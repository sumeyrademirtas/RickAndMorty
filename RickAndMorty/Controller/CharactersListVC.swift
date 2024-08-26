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
    private let viewModel = CharacterListViewViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Characters"

        // ViewModel'in closure'ını tanımlama
        viewModel.didFetchCharacters = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        viewModel.fetchCharacters() // Verileri yüklemeye başlama
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
        view.backgroundColor = .systemBlue

        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 72

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
        return viewModel.cellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCell.identifier, for: indexPath) as? CharacterListCell else {
            fatalError("The TableView could no dequeue a CustomCell in MainViewController")
        }
        cell.configure(with: viewModel.cellViewModels[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG: PRINT:", indexPath.row)
    }
}
