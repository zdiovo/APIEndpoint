

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(class cell: T.Type) {
        register(cell.self, forCellReuseIdentifier: cell.className)
    }
    
    func dequeueReusableOptional<T: UITableViewCell>(class cell: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.className) as? T
    }
    
    func dequeueReusable<T: UITableViewCell>(class cell: T.Type) -> T {
        guard let aCell = dequeueReusableCell(withIdentifier: cell.className) as? T else {
            fatalError("Couldn't find UITableViewCell for \(cell.className), make sure the cell is registered with table view")
        }
        return aCell
    }
    
    func dequeueReusable<T: UITableViewCell>(class cell: T.Type, for indexPath: IndexPath) -> T {
        guard let aCell = dequeueReusableCell(withIdentifier: cell.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell for \(cell.className), make sure the cell is registered with table view")
        }
        return aCell
    }
    
    func registerCell<T: UITableViewCell>(nib cell: T.Type) {
        register(UINib(nibName: cell.className, bundle: nil), forCellReuseIdentifier: cell.className)
    }
}
