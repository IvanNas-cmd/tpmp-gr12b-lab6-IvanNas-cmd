# Task 5 – Discount Calculator (Variant 17)

**Author:** Ivan Nasennik, Group 12b  
**Language:** Swift 5 + SwiftUI

## Description

Two-screen SwiftUI app that calculates a purchase discount.

### Discount rules (Variant 17)

**By Quantity**
| Items | Discount |
|---|---|
| < 10 | 0% |
| ≥ 10 | 1% |
| ≥ 20 | 3% |

**By Cost**
| Cost | Discount |
|---|---|
| ≤ 50 | 0% |
| > 50 and ≤ 100 | 3% |
| > 100 | 5% |

## Localization

Supported: **English**, **Russian**, **Belarusian**.

## Layout

Adaptive for portrait & landscape orientations and all iPhone/iPad screen sizes via SwiftUI's native layout system.

## Installation

1. Create a new Xcode project (App, Swift, **SwiftUI** interface).
2. Replace `ContentView.swift` with the file from this branch.
3. Copy the three `*.lproj/Localizable.strings` files; enable the three locales in project settings.
4. Run with Cmd+R.

## Authors

Ivan Nasennik — Group 12b
