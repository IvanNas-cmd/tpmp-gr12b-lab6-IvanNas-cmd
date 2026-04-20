# Task 3 – BMR & BMI Calculator

**Author:** Ivan Nasennik, Group 12b  
**Language:** Swift 5 + UIKit

## Description

Calculates the Body Mass Index (BMI) and Basal Metabolic Rate (BMR) using the Harris-Benedict formula, then shows total daily energy expenditure based on the selected activity level.

### Formulas

**BMI** = weight (kg) / height (m)²

**BMR (male)** = 88.362 + 13.397×weight + 4.799×height − 5.677×age

**BMR (female)** = 447.593 + 9.247×weight + 3.098×height − 4.330×age

**TDEE** = BMR × activity multiplier (1.2 / 1.375 / 1.55 / 1.725 / 1.9)

## Installation

1. Create a new Xcode project (App, Swift, Storyboard).
2. Copy `ViewController.swift` into the project.
3. In `Main.storyboard` add 3 `UITextField`s, 2 `UISegmentedControl`s, a `UIButton`, and a `UILabel` (lines = 4).
4. Connect outlets and action (`calculateTapped`).

## Authors

Ivan Nasennik — Group 12b
