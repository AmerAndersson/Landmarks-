//
//  PageViewController.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-13.
//
import SwiftUI
import UIKit

/// Pass a binding to this property down to the PageViewController view.
/// The PageViewController updates the binding to match the visible page.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    /// To scroll pages between landmarks.
    var pages: [Page]
    @Binding var currentPage: Int

    /// calls this makeCoordinator() before makeUIViewController(),
    /// and access to the coordinator object when configuring view controller.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    /// creates a UIPageViewController with the desired configuration
    /// SwiftUI calls this method a single time when it’s ready to display the view,
    /// and then manages the view controller’s life cycle.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        /// The coordinator as the data source of the UIPageViewController.
        /// Assign the coordinator as the delegate for the UIPageViewController,
        /// in addition to the data source. With the binding connected in both directions,
        /// the text view updates to show the correct page number after each swipe.

        return pageViewController
    }

    /// calls setViewControllers() to provide a view controller for display.
    /// The coordinator is a good place to store these controllers,
    /// because the system initializes them only once,
    /// and before you need them to update the view controller.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
        /// passing the value of the currentPage binding.
    }

    /// The view controller’s data source.
    /// Enable swiping interactions to move from page to page.
    /// Initialize an array of controllers in the coordinator
    /// using the pages array of views.
    /// UIHostingController that hosts the page SwiftUI view on every update.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }

        /// The methods establish the relationships between view controllers,
        /// so that it can swipe back and forth between them.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController? 
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
            return controllers.last
            }
            return controllers[index - 1]
       }

        /// The methods establish the relationships between view controllers,
        /// so that it can swipe back and forth between them.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController? 
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        /// Because SwiftUI calls this method whenever a page
        /// switching animation completes, you can find the index
        /// of the current view controller and update the binding.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
           }
        }
    }
}
