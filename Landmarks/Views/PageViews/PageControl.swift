//
//  PageControl.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-13.
//

import SwiftUI
import UIKit

/// Add a custom page control
/// It is ready to add a custom UIPageControl
/// to view, wrapped in SwiftUI UIViewRepresentable view.
/// the page control interactive so users can tap one side 
/// or the other to move between pages.
/// Create a nested Coordinator type in PageControl,
/// and add a makeCoordinator() method to create and return a new coordinator.
/// Because UIControl subclasses like UIPageControl use the target-action pattern
/// instead of delegation, this Coordinator implements an @objc method to update the current page binding.
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
