//
//  ViewController.swift
//  MeuCoreDataMinhaVida
//
//  Created by Lucas Pinheiro Almeida on 03/12/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var searchActive: Bool = false
    
    var clientes: [Cliente]? {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        search.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.


        let context = CoreDataManager().persistentContainer.viewContext

        let cliente = Cliente(insertInto: context)
//        cliente.nome = "beatriz"
//        cliente.fone = "01233-56789"
//        cliente.nrFilhos = 4

        do {
            try context.save()
        } catch {
            print("fail")
        }

        let fetchRequest: NSFetchRequest<Cliente> = Cliente.fetchRequest()
        self.clientes = try? context.fetch(fetchRequest)
        
//        for cliente in clientes! {
//            print(cliente.nome)
//        }
  
//
//        let request = NSFetchRequest<Cliente>(entityName: Cliente.entity().managedObjectClassName)
////
////        let predicate = NSPredicate(format: "nome == %@", "lucas")
////        request.predicate = predicate
//
////        let predicateOne = NSPredicate(format: "nome == %@", "sabrina")
////        let predicateTwo = NSPredicate(format: "nrFilhos == %d", 6)
////
////        let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [
////            predicateOne, predicateTwo
////        ])
//
//        let predicateThree = NSPredicate(format: "nome CONTAINS[cd] %@", "i")
//
//        let sort1 = NSSortDescriptor(key: "fone", ascending: true)
//        let sort2 = NSSortDescriptor(key: "nrFilhos", ascending: true)
//
//        request.predicate = predicateThree
//
////        request.sortDescriptors = [sort1, sort2]
//
//        do {
//            let clientes = try context.fetch(request)
//            for cliente in clientes {
//                print("\(cliente.nome!); \(cliente.fone!); \(cliente.nrFilhos)")
//            }
//        } catch {
//            print("fail")
//        }
        

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let context = CoreDataManager().persistentContainer.viewContext
        
        let request = NSFetchRequest<Cliente>(entityName: Cliente.entity().managedObjectClassName)
        
        let predicate = NSPredicate(format: "nome CONTAINS[cd] %@", searchBar.text!)
        
        request.predicate = predicate
        
        do {
            let clientes = try context.fetch(request)
            for c in clientes {
                print(c.nome)
            }
            self.tableView.reloadData()
        } catch {
            print("fail")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let context = CoreDataManager().persistentContainer.viewContext
        
        let request = NSFetchRequest<Cliente>(entityName: Cliente.entity().managedObjectClassName)
        
        let predicate = NSPredicate(format: "nome CONTAINS[cd] %@", searchBar.text!)
        
        request.predicate = predicate
        
        do {
            let clientes = try context.fetch(request)
            for c in clientes {
                print(c.nome)
            }
        } catch {
            print("fail")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clientes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clienteCell", for: indexPath) as! ClientesTableViewCell
        let cliente = clientes?[indexPath.row]
        cell.textLabel?.text = cliente?.nome
        cell.foneLabel.text = cliente?.fone
        
        return cell
    }
}
