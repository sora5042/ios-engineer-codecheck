//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import Nuke

class DetailRepositoryViewController: UIViewController {

    var repositoryItem: Item?

    // Label
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var watchesLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var issuesLabel: UILabel!
    @IBOutlet private weak var licenseLabel: UILabel!

    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!

    // Button
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var safariButton: UIButton!

    // UIView
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var countView: UIView!
    @IBOutlet private weak var licenseView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupRepositoryItem()
    }

    private func setupViews() {
        titleView.layer.borderWidth = 1
        titleView.layer.borderColor = UIColor.lightGray.cgColor
        countView.layer.borderWidth = 1
        countView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 25
        licenseView.layer.borderWidth = 1
        licenseView.layer.borderColor = UIColor.lightGray.cgColor
        safariButton.layer.cornerRadius = 12

        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        safariButton.addTarget(self, action: #selector(tappedSafariButton), for: .touchUpInside)
    }

    private func setupRepositoryItem() {
        descriptionTextView.text = repositoryItem?.description
        titleLabel.text = repositoryItem?.fullName
        languageLabel.text = "written in \(repositoryItem?.language ?? "")"
        starsLabel.text = String(repositoryItem?.stargazersCount ?? 0)
        watchesLabel.text = String(repositoryItem?.watchersCount ?? 0)
        forksLabel.text = String(repositoryItem?.forksCount ?? 0)
        issuesLabel.text = String(repositoryItem?.openIssuesCount ?? 0)
        licenseLabel.text = repositoryItem?.license?.name

        if let url = URL(string: repositoryItem?.owner.avatarUrl ?? "") {
            Nuke.loadImage(with: url, into: imageView)
        }
    }

    @objc private func tappedSafariButton() {
        guard let repositoryUrl = URL(string: repositoryItem?.owner.htmlUrl ?? "") else { return }
        UIApplication.shared.open(repositoryUrl)
    }

    @objc private func tappedBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
