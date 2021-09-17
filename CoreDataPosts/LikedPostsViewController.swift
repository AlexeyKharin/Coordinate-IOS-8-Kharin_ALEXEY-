
//  LikedPostsViewController.swift
//  Navigation
//  Created by Alexey Kharin on 18.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.


import UIKit
import CoreData

class LikedPostsViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default
    
    private let stack = CoreDataStack()
    
    let request: NSFetchRequest<LikedContent> = LikedContent.fetchRequest()
    
    private lazy var fetchResultsController: NSFetchedResultsController<LikedContent> = {
        
        request.sortDescriptors = [NSSortDescriptor(key: "likes", ascending: false)]
        
        let controller = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: stack.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        controller.delegate = self
        return controller
    }()
    //    MARK:- Filter
    lazy var alertControllerFilter: UIAlertController = {
        let alertController = UIAlertController(title: "Фильтр по названию поста", message: nil, preferredStyle: .alert)
        var cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in }
        var continueAction = UIAlertAction(title: "Применить фильтр", style: .destructive) { _ in
            let textField = alertController.textFields![0] as UITextField
            guard let text = textField.text else { return }
            let predicate = NSPredicate(format: "%K LIKE %@", #keyPath(LikedContent.title), "\(text)")
            self.request.predicate = predicate
            self.stack.viewContext.perform {
                do {
                    try self.fetchResultsController.performFetch()
                    self.tableViewPosts.reloadData()
                } catch {
                    print(error)
                }
            }
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите фильтр"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)
        return alertController
    }()
    
    @IBAction func fallFilter(_ sender: Any) {
        request.predicate = nil
        stack.viewContext.perform {
            do {
                try self.fetchResultsController.performFetch()
                self.tableViewPosts.reloadData()
            } catch {
                print(error)
            }
        }
    }
    @IBAction func filter(_ sender: Any) {
        self.present(alertControllerFilter, animated: true, completion: nil)
    }
    
    private var isInitiallyLoaded: Bool = false
    
    @IBOutlet weak var tableViewPosts: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(forName: .NSManagedObjectContextDidSave, object: nil , queue: nil) { notification in
            self.stack.viewContext.perform {
                self.stack.viewContext.mergeChanges(fromContextDidSave: notification)
            }
        }
        
        tableViewPosts.backgroundColor = .white
        tableViewPosts.dataSource = self
        tableViewPosts.delegate = self
        tableViewPosts.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
    }
    
    //    MARK:- PerformFetch
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !isInitiallyLoaded {
            isInitiallyLoaded = true
            stack.viewContext.perform {
                do {
                    try self.fetchResultsController.performFetch()
                    self.tableViewPosts.reloadData()
                } catch {
                    print(error)
                }
            }
        }
    }
}
//MARK:-  UITableViewDataSource, UITableViewDelegate
extension LikedPostsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: PostTableViewCell.self),
            for: indexPath) as! PostTableViewCell
        
        let likedPost = fetchResultsController.object(at: indexPath)
        if let saferyImage = likedPost.image, let saferyLikes = likedPost.likes, let safetyViews = likedPost.views,  let saferyTitle = likedPost.title, let saferyDiscreption = likedPost.discreption {
            cell.content = ImageContent(image: saferyImage, likes: saferyLikes, views: safetyViews, discreption: saferyDiscreption , title: saferyTitle)
            return cell
        }
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (_, _, callback) in
            guard let self = self else { return }
            
            let deletedPost = self.fetchResultsController.object(at: indexPath)
            self.stack.remove(likedContent: deletedPost)
            
            
            
            callback(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [action])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}
//    MARK:- Animate moves cells
extension LikedPostsViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>
    ) {
        tableViewPosts.beginUpdates()
    }
    
    func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        didChange anObject: Any,
        at indexPath: IndexPath?,
        for type: NSFetchedResultsChangeType,
        newIndexPath: IndexPath?
    ) {
        switch type {
        case .delete:
            guard let indexPath = indexPath else { fallthrough }
            
            tableViewPosts.deleteRows(at: [indexPath], with: .automatic)
        case .insert:
            guard let newIndexPath = newIndexPath else { fallthrough }
            
            tableViewPosts.insertRows(at: [newIndexPath], with: .automatic)
        case .move:
            guard
                let indexPath = indexPath,
                let newIndexPath = newIndexPath
            else { fallthrough }
            
            tableViewPosts.moveRow(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { fallthrough }
            
            tableViewPosts.reloadRows(at: [indexPath], with: .automatic)
        @unknown default:
            fatalError()
        }
    }
    
    func controllerDidChangeContent(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>
    ) {
        tableViewPosts.endUpdates()
    }
}
