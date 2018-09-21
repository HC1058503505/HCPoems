//
//  HCRecommandViewController.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class HCRecommandViewController: UIViewController {

    fileprivate let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageV = UIImageView(frame: view.bounds)
        imageV.image = UIImage(named: "home_page_bottom_bg")
        view.addSubview(imageV)
        
        let tableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        tableView.register(HCPoemsTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        view.addSubview(tableView)
        
        let recommandViewModel = HCRecommandViewModel()
        let input = HCRecommandViewModel.Input.init(page: Observable.just(0))
        let output = recommandViewModel.transform(input: input).poemsList
        
        output.bind(to: tableView.rx.items){ (tableV, row, element) in
            let poemCell = tableV.dequeueReusableCell(withIdentifier: "Cell") as! HCPoemsTableViewCell
            let poem = element as! HCPoemModel
            poemCell.configureCell(poem: poem)
            return poemCell
//            if self?.traitCollection.forceTouchCapability == UIForceTouchCapability.available {
//                if !cell.isForceTouchRegistered {
//                    cell.isForceTouchRegistered = true
//                    self?.registerForPreviewing(with: (self)!, sourceView: cell)
//                }
//            }
//            return cell
            }
            .disposed(by: disposeBag)

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
