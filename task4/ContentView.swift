//
//  ContentView.swift
//  Task4 – SwiftUI Getting Started
//  Author: Ivan Nasennik, Group 12b
//
//  Based on: https://www.raywenderlich.com/3715234-swiftui-getting-started
//

import SwiftUI

// MARK: - RatingView

/// A reusable star-rating component.
struct RatingView: View {

    // MARK: Properties

    var maxRating: Int = 5

    @Binding var currentRating: Int

    var offColor  = Color.gray
    var onColor   = Color.yellow

    // MARK: Body

    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { number in
                Image(systemName: "star.fill")
                    .foregroundColor(number <= currentRating ? onColor : offColor)
                    .onTapGesture {
                        currentRating = number
                    }
            }
        }
    }
}

// MARK: - WelcomeView

/// A simple welcome screen with an image, title and a rating control.
struct WelcomeView: View {

    // MARK: State

    @State private var rating: Int = 0
    @State private var showDetail = false

    // MARK: Body

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                // MARK: Hero image
                Image(systemName: "iphone")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 180)
                    .foregroundColor(.accentColor)

                // MARK: Title
                Text("Welcome to SwiftUI!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text("Rate your experience:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // MARK: Rating
                RatingView(currentRating: $rating)
                    .font(.title)

                Text("Your rating: \(rating) / 5")
                    .font(.callout)
                    .foregroundColor(.secondary)

                // MARK: Navigation link to detail screen
                NavigationLink(destination: DetailView(), isActive: $showDetail) {
                    Button("Go to Detail Screen") {
                        showDetail = true
                    }
                    .buttonStyle(.borderedProminent)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Task 4")
        }
    }
}

// MARK: - DetailView

/// A secondary screen demonstrating navigation.
struct DetailView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)

            Text("Detail Screen")
                .font(.title)
                .fontWeight(.semibold)

            Text("This is a second scene navigated to from the Welcome screen.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
        .navigationTitle("Detail")
    }
}

// MARK: - Preview

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeView()
            WelcomeView()
                .preferredColorScheme(.dark)
        }
    }
}
