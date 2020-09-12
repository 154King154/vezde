//
//  NewsfeedTableViewController.swift
//  vk
//
//  Created by lazarevtill on 12.09.2020.
//  Copyright © 2020 lazarevtill. All rights reserved.
//

import UIKit

final class NewsfeedTableViewController: UITableViewController {
    
    // MARK: - Model
    
    private var donations = [Donation]()
    
    // MARK: - Manager
    
    private let storageManager = StorageManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 400
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    private func getData() {
        storageManager.fetchDonations { result in
            switch result {
            case .success(let donations):
                self.donations = donations
                tableView.reloadData()
            case .failure(let error):
                showAlert(with: AlertTitle.failedToFetchDonations, and: error.localizedDescription)
            }
        }
    }
    class Component: UIView {

        let label = UILabel(frame: .zero)

        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
                label.topAnchor.constraint(equalTo: topAnchor),
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                ])
        }

        func configure(text: String) {
            label.text = text
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return donations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "donationCell", for: indexPath) as! DonationCell
        let donation = donations[indexPath.row]
        cell.configure(donation: donation)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let donation = donations[indexPath.row]
        storageManager.delete(donation: donation)
        donations.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}
