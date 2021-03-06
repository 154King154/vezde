//
//  DonationCell.swift
//  vk
//
//  Created by lazarevtill on 12.09.2020.
//  Copyright © 2020 lazarevtill. All rights reserved.
//

import UIKit

final class DonationCell: UITableViewCell {

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var donationImageView: UIImageView!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var amountLabel: UILabel!
    
    func configure(donation: Donation) {
        titleLabel.text = donation.title
        descriptionLabel.text = donation.decriptionText
        if let imageData = donation.image {
            donationImageView.image = UIImage(data: imageData)
        }
    }
    
    @IBAction func helpButtonPressed(_ sender: UIButton) {
        progressView.progress += 0.2
        if progressView.progress == 1 {
            sender.setImage(#imageLiteral(resourceName: "Style 6_ Commerce"), for: .normal)
            progressView.tintColor = .green
            amountLabel.text = "Вся сумма собрана!"
        }
    }
}
