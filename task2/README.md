# Task 2 – Weather & Museum Viewer (Variant 17)

**Author:** Ivan Nasennik, Group 12b  
**Language:** Objective-C

## Description

Displays weather (temperature with colour) and a famous museum for cities in Georgia and France.

### Cities
| City | Country | Temp | Museum |
|---|---|---|---|
| Tbilisi | Georgia | 25°C 🔴 | National Museum of Georgia |
| Batumi  | Georgia | 22°C 🔴 | Batumi Archaeological Museum |
| Paris   | France  | 15°C 🔵 | The Louvre |
| Lyon    | France  | 18°C 🔵 | Musée des Confluences |

Colour rule: **red** if temp > 20°C, **blue** otherwise.

## Localization

Supported: English, Russian, Belarusian.

## Installation

1. Create a new Xcode project (App, Objective-C, Storyboard).
2. Copy `ViewController.h` and `ViewController.m` into the project.
3. Copy `*.lproj/Localizable.strings` files; enable the three locales in project settings.
4. In `Main.storyboard` add a `UISegmentedControl`, two `UILabel`s, a `UIImageView`, and a `UIButton`.
5. Connect outlets and actions to `ViewController`.
6. Add museum images to `Assets.xcassets` (names: `museum_tbilisi`, `museum_batumi`, `museum_paris`, `museum_lyon`).

## Authors

Ivan Nasennik — Group 12b
