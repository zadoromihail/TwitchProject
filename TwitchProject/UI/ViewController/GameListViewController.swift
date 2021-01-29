//
//  GameListViewController.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 28.01.2021.
//

import UIKit
import SnapKit

class GameListViewController: UIViewController {
    
    var viewModel: GameListViewModel!
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindUI()
    }
    
    private func setupUI() {
        title = "Top games"
        
        setupTableView()
    }
    
    private func bindUI() {
        viewModel.getInfo { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GameCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
}

extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? GameCell,
            let card = viewModel.game(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.configure(gameInfo: card)
        
        return cell
    }
}

extension GameListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let game = viewModel.game(at: indexPath.row) else { return }
        
        let vc = DetailViewController()
        vc.configure(gameInfo: game)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
