//
//  VerticalTableVC.swift
//  UIStackView
//
//  Created by 黄坤鹏 on 2020/6/21.
//  Copyright © 2020 黄坤鹏. All rights reserved.
//  垂直布局TableViewCell

import Foundation

class VerticalTableVC: UIViewController {
    // tableview
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            automaticallyAdjustsScrollViewInsets = false
        }
        return tableView
    }()
    
    var dataArray = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10{
            let str1 = "label1文本:\n" + _getRandomStr(str:"好长",max: 40)
            let str2 = "label2文本:\n" + _getRandomStr(str:"好长",max: 100)
            let str3 = "label3文本:" + _getRandomStr(str:"好长",max: 2)
            let str4 = "label4文本:\n" + _getRandomStr(str:"好长",max: 200)
            dataArray.append([str1,str2,str3,str4])
        }
        
        _setupUI()
        _layoutUI()
    }
    
    
    fileprivate func _getRandomStr(str:String,max:UInt32) -> String{
        let randomNum = arc4random() % max
        var result = ""
        for _ in 0..<randomNum {
            result.append(str)
        }
        return result
    }
    
    fileprivate func _setupUI(){
        tableView.register(CellStackView.self, forCellReuseIdentifier: NSStringFromClass(CellStackView.self))
        view.addSubview(tableView)
    }
    fileprivate func _layoutUI(){
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
}

extension VerticalTableVC :UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =  tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CellStackView.self)) as? CellStackView {
            cell.model = dataArray[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: NSStringFromClass(CellStackView.self)) { [weak self](cell) in
            guard let weakSelf = self else { return }
            if let cell = cell as? CellStackView{
                cell.model = weakSelf.dataArray[indexPath.row]
            }
        }
    }
}
