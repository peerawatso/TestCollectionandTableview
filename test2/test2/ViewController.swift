//
//  ViewController.swift
//  test2
//
//  Created by DSolution Macbook on 9/11/2563 BE.
//

import UIKit

class ViewController: UIViewController {
    var colorsArray = Colors()
    var colorsArray2 = Colors2()
    var pageChange: Int = 1
    var pageheight: CGFloat = 0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var PageSegment: UISegmentedControl!
//    var colorsArray = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        PageSegment.selectedSegmentIndex = 0
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableviewcellid")
        let cellNib2 = UINib(nibName: "TableViewCellPage2", bundle: nil)
        self.tableView.register(cellNib2, forCellReuseIdentifier: "tableviewcellid2")
    }

    @IBAction func PageChange(_ sender: Any) {
        switch PageSegment.selectedSegmentIndex {
        case 0:
            PageSegment.selectedSegmentIndex = 0
            tableView.reloadData()
          break
        case 1:
            PageSegment.selectedSegmentIndex = 1
            tableView.reloadData()
           break
        case 2:
        break
        default:
            break
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch PageSegment.selectedSegmentIndex {
        case 0:
            pageChange = colorsArray.objectsArray.count
        case 1:
            pageChange = colorsArray2.objectsArray.count
        default:
            break
        }
        return pageChange

//        return colorsArray.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch PageSegment.selectedSegmentIndex {
        case 0:
            pageChange = colorsArray.objectsArray[section].colors.count
        case 1:
            pageChange = colorsArray2.objectsArray[section].colors.count
        default:
            break
        }
        return pageChange
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch PageSegment.selectedSegmentIndex {
        case 0:
            pageheight = 200
        case 1:
            pageheight = 500
        default:
            break
        }
        return pageheight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch PageSegment.selectedSegmentIndex {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid", for: indexPath) as? TableViewCell {
                let rowArray = colorsArray.objectsArray[indexPath.section].colors[indexPath.row]
                cell.colorView.backgroundColor = rowArray.color
                return cell
           }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid2", for: indexPath) as? TableViewCellPage2 {
                let rowArray = colorsArray2.objectsArray[indexPath.section].colors[indexPath.row]
                cell.updateCellWith(row: rowArray)
                return cell
           }
        default:
            break
        }
        return UITableViewCell()
    }
    
}


