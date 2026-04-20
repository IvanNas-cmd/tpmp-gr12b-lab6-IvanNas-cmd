//
//  ViewController.swift
//  Task3 – BMR & BMI Calculator
//  Author: Ivan Nasennik, Group 12b
//
//  Adapted from Swift 3 to Swift 5.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {

    // MARK: - Outlets

    /// Age input field
    @IBOutlet weak var ageTextField: UITextField!

    /// Height input field (cm)
    @IBOutlet weak var heightTextField: UITextField!

    /// Weight input field (kg)
    @IBOutlet weak var weightTextField: UITextField!

    /// Gender selector: 0 = Male, 1 = Female
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

    /// Activity level selector (0…4)
    @IBOutlet weak var activitySegmentedControl: UISegmentedControl!

    /// Multi-line label that shows the calculated result
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismissKeyboardGesture()
    }

    // MARK: - Setup

    private func setupDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    // MARK: - Actions

    @IBAction func calculateTapped(_ sender: UIButton) {
        guard
            let ageText    = ageTextField.text,    let age    = Double(ageText),
            let heightText = heightTextField.text,  let height = Double(heightText),
            let weightText = weightTextField.text,  let weight = Double(weightText),
            age > 0, height > 0, weight > 0
        else {
            resultLabel.text = "Please enter valid positive numbers."
            return
        }

        let isMale = genderSegmentedControl.selectedSegmentIndex == 0

        // MARK: BMI – body mass index
        let heightM = height / 100.0
        let bmi = weight / (heightM * heightM)
        let bmiCategory = bmiCategory(for: bmi)

        // MARK: BMR – Harris-Benedict formula
        let bmr: Double
        if isMale {
            bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
        } else {
            bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
        }

        // MARK: Total daily energy expenditure
        let activityMultipliers = [1.2, 1.375, 1.55, 1.725, 1.9]
        let idx = min(activitySegmentedControl.selectedSegmentIndex, activityMultipliers.count - 1)
        let tdee = bmr * activityMultipliers[idx]

        resultLabel.text = String(
            format: "BMI: %.1f (%@)\nBMR: %.0f kcal/day\nCalories to maintain weight: %.0f kcal/day",
            bmi, bmiCategory, bmr, tdee
        )
    }

    // MARK: - Helpers

    /// Returns a human-readable BMI category string.
    private func bmiCategory(for bmi: Double) -> String {
        switch bmi {
        case ..<18.5: return "Underweight"
        case 18.5..<25.0: return "Normal"
        case 25.0..<30.0: return "Overweight"
        default: return "Obese"
        }
    }
}
