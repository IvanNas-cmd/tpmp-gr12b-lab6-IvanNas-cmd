//
//  ContentView.swift
//  Task5 – Discount Calculator (Variant 17)
//  Author: Ivan Nasennik, Group 12b
//
//  Variant 17: discount by quantity (1% for 10 items, 3% for 20 items)
//              or by cost (3% for >50, 5% for >100).
//  Localization: English, Russian, Belarusian.
//  Layout: adaptive for portrait & landscape, supports all screen sizes.
//

import SwiftUI

// MARK: - DiscountType

enum DiscountType: Int, CaseIterable, Identifiable {
    case byQuantity = 0
    case byCost     = 1

    var id: Int { rawValue }

    var localizedTitle: String {
        switch self {
        case .byQuantity: return NSLocalizedString("By Quantity", comment: "")
        case .byCost:     return NSLocalizedString("By Cost",     comment: "")
        }
    }
}

// MARK: - DiscountResult

struct DiscountResult {
    let percent:      Double
    let discountSum:  Double
    let finalCost:    Double
}

// MARK: - DiscountCalculator

/// Pure business-logic, no UI dependencies.
enum DiscountCalculator {

    // MARK: Calculation

    static func calculate(cost: Double, quantity: Int, type: DiscountType) -> DiscountResult {
        var percent: Double = 0

        switch type {
        case .byQuantity:
            if quantity >= 20 {
                percent = 3
            } else if quantity >= 10 {
                percent = 1
            }

        case .byCost:
            if cost > 100 {
                percent = 5
            } else if cost > 50 {
                percent = 3
            }
        }

        let discountSum = cost * percent / 100.0
        return DiscountResult(percent: percent, discountSum: discountSum, finalCost: cost - discountSum)
    }
}

// MARK: - InputRow

private struct InputRow: View {
    let title: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .decimalPad

    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("0", text: $text)
                .keyboardType(keyboardType)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: 120)
        }
    }
}

// MARK: - ResultView

private struct ResultView: View {
    let result: DiscountResult

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            label("Discount",        value: String(format: "%.0f%%", result.percent))
            label("Discount Amount", value: String(format: "%.2f", result.discountSum))
            label("Final Cost",      value: String(format: "%.2f", result.finalCost))
        }
    }

    // MARK: Helpers

    @ViewBuilder
    private func label(_ key: String, value: String) -> some View {
        HStack {
            Text(NSLocalizedString(key, comment: ""))
                .fontWeight(.medium)
            Spacer()
            Text(value)
                .foregroundColor(.accentColor)
        }
    }
}

// MARK: - ContentView

struct ContentView: View {

    // MARK: State

    @State private var costText:     String = ""
    @State private var quantityText: String = ""
    @State private var discountType: DiscountType = .byQuantity
    @State private var result:       DiscountResult?
    @State private var showError:    Bool = false

    // MARK: Body

    var body: some View {
        NavigationView {
            Form {

                // MARK: - Discount type picker
                Section(header: Text(NSLocalizedString("Discount Type", comment: ""))) {
                    Picker("", selection: $discountType) {
                        ForEach(DiscountType.allCases) { type in
                            Text(type.localizedTitle).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                // MARK: - Input section
                Section(header: Text(NSLocalizedString("Input Data", comment: ""))) {
                    InputRow(
                        title:        NSLocalizedString("Cost of Items", comment: ""),
                        text:         $costText,
                        keyboardType: .decimalPad
                    )
                    InputRow(
                        title:        NSLocalizedString("Quantity of Items", comment: ""),
                        text:         $quantityText,
                        keyboardType: .numberPad
                    )
                }

                // MARK: - Calculate button
                Section {
                    Button(action: calculate) {
                        Text(NSLocalizedString("Calculate", comment: ""))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }

                // MARK: - Result section
                if let result {
                    Section(header: Text(NSLocalizedString("Result", comment: ""))) {
                        ResultView(result: result)
                    }
                }
            }
            .navigationTitle(NSLocalizedString("Discount Calculator", comment: ""))
            .alert(NSLocalizedString("Invalid Input", comment: ""),
                   isPresented: $showError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(NSLocalizedString("Please enter valid positive numbers.", comment: ""))
            }
        }
    }

    // MARK: - Calculation

    private func calculate() {
        let normalizedCost = costText.replacingOccurrences(of: ",", with: ".")
        guard
            let cost     = Double(normalizedCost), cost >= 0,
            let quantity = Int(quantityText),      quantity >= 0
        else {
            showError = true
            return
        }
        result = DiscountCalculator.calculate(cost: cost, quantity: quantity, type: discountType)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
