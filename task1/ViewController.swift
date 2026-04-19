// ViewController.swift
// Task 1 – Background Switcher
// Author: Ivan Nasennik, Group 12b

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var backgroundSwitch: UISwitch!
    @IBOutlet weak var switchIndicator: UILabel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: add support for dark-mode system colors if needed
        setupInitialState()
    }

    // MARK: - Private

    private func setupInitialState() {
        switchIndicator.textColor = .white
        applyBackground(isOn: false)
    }

    private func applyBackground(isOn: Bool) {
        let imageName = isOn ? "bg1" : "bg2"
        switchIndicator.text = "Background image: \(imageName).jpg"
        if let image = UIImage(named: imageName) {
            view.backgroundColor = UIColor(patternImage: image)
        } else {
            // FIXME: replace with your actual asset names if different
            view.backgroundColor = isOn ? .systemBlue : .systemGray
        }
    }

    // MARK: - Actions

    @IBAction func backgroundSwitchTapped(_ sender: UISwitch) {
        applyBackground(isOn: sender.isOn)
    }
}
