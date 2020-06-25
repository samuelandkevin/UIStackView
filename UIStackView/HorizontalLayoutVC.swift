//
//  HorizontalLayoutVC.swift
//  UIStackView
//
//  Created by 黄坤鹏 on 2020/6/21.
//  Copyright © 2020 黄坤鹏. All rights reserved.
//  水平布局UIViewController

import Foundation

import SnapKit

class HorizontalLayoutVC: UIViewController {
    
    private lazy var lb1: UILabel = {
        let lb1 = UILabel()
        lb1.text = "lb1 长长长长长长长长长长长长长长长长长长长长长长长长长长长长长"
        lb1.font = .systemFont(ofSize: 15, weight: .bold)
        lb1.numberOfLines = 0
        lb1.backgroundColor = .red
        lb1.tag = 1
        lb1.isUserInteractionEnabled = true
        lb1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onLabel(_:))))
        return lb1
    }()
    
    
    private lazy var lb2: UILabel = {
        let lb2 = UILabel()
        lb2.text = "lb2 label 长长"
        lb2.font = .systemFont(ofSize: 15, weight: .bold)
        lb2.numberOfLines = 0
        lb2.backgroundColor = .green
        lb2.tag = 2
        lb2.isUserInteractionEnabled = true
        lb2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onLabel(_:))))
        return lb2
    }()
    
    
    private lazy var lb3: UILabel = {
        let lb3 = UILabel()
        lb3.text = "lb3 label长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长"
        lb3.font = .systemFont(ofSize: 15, weight: .bold)
        lb3.numberOfLines = 0
        lb3.backgroundColor = .blue
        lb3.tag = 3
        lb3.isUserInteractionEnabled = true
        lb3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onLabel(_:))))
        return lb3
    }()
    
    private lazy var lb4: UILabel = {
        let lb4 = UILabel()
        lb4.text = "lb4 label"
        lb4.font = .systemFont(ofSize: 15, weight: .medium)
        lb4.numberOfLines = 0
        lb4.backgroundColor = .orange
        lb4.tag = 4
        lb4.isUserInteractionEnabled = true
        lb4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onLabel(_:))))
        return lb4
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lb1, lb2,lb3,lb4])
        stackView.axis    = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    fileprivate lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .gray
        return containerView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupUI()
        _layoutUI()

    }
    
    // MARK: - Action
    @objc func onLabel(_ sender:UITapGestureRecognizer){
        if let v = sender.view as? UILabel {
            v.isHidden = true
            _updateFromStackViewAttributes()
        }
    }
    
    @objc func onReload(){
        for v in stackView.arrangedSubviews{
            v.isHidden = false
        }
    }
    
    // MARK: - Private
    
    fileprivate func _setupUI(){
        let rightBarItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(onReload))
        self.navigationItem.rightBarButtonItem = rightBarItem
        view.backgroundColor = .white
        view.addSubview(containerView)
        containerView.backgroundColor = .gray
        containerView.addSubview(stackView)
    }
    
    fileprivate func _layoutUI(){
        containerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func _updateFromStackViewAttributes(){
        let size = containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        debugPrint("stackView 宽度是：\(size.width) 高度是：\(size.height)")
    }
    
}

