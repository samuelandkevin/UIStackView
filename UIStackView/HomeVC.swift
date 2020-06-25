//
//  HomeVC.swift
//  UIStackView
//
//  Created by 黄坤鹏 on 2020/6/21.
//  Copyright © 2020 黄坤鹏. All rights reserved.
//  首页

import Foundation


class HomeVC: UITableViewController {
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.navigationController?.pushViewController(VerticalTableVC(), animated: true)
        }
        else if indexPath.row == 1{
            self.navigationController?.pushViewController(VerticalLayoutVC(), animated: true)
        }
        else if indexPath.row == 2{
            self.navigationController?.pushViewController(HorizontalLayoutVC(), animated: true)
        }
    }
}
