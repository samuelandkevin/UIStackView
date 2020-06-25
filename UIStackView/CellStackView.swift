//
//  CellStackView.swift
//  UIStackView
//
//  Created by 黄坤鹏 on 2020/6/21.
//  Copyright © 2020 黄坤鹏. All rights reserved.
//

import Foundation

class  CellStackView: UITableViewCell {
    
    private lazy var lb1: UILabel = {
        let lb1 = UILabel()
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
        stackView.axis    = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    fileprivate lazy var viewBot: UIView = {
        let viewBot = UIView()
        viewBot.backgroundColor = .gray
        return viewBot
    }()
    
    var model:Array<String>? {
        didSet{
            if let m = model{
                lb1.text =  m[0]
                lb2.text =  m[1]
                lb3.text =  m[2]
                lb4.text =  m[3]
                
                lb1.isHidden = m[0].count == 0
                lb2.isHidden = m[1].count == 0
                lb3.isHidden = m[2].count == 0
                lb4.isHidden = m[3].count == 0
                
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        _setupUI()
        _layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private
extension CellStackView{
    fileprivate func _setupUI(){
        self.selectionStyle = .none
        contentView.addSubview(stackView)
        contentView.addSubview(viewBot)
    }
    
    fileprivate func _layoutUI(){

        stackView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
            make.bottom.equalTo(viewBot.snp.top)
        }
        viewBot.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(contentView)
            make.height.equalTo(10)
        }
    }
    
    @objc func onLabel(_ sender:UITapGestureRecognizer){
        if let v = sender.view as? UILabel {
            v.isHidden = true
        }
    }
}

