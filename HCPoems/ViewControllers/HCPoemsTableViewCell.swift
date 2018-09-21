//
//  HCPoemsTableViewCell.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import UIKit
import SnapKit
class HCPoemsTableViewCell: UITableViewCell {

    fileprivate let titleL = UILabel()
    
    fileprivate let authorL = UILabel()
    
    fileprivate let contentL = UILabel()
    
    fileprivate let tagsL = UILabel()
    static func poemsCell(tableView:UITableView, reuseIdentifier:String) -> HCPoemsTableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if cell == nil {
            cell = HCPoemsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        }
        return cell as! HCPoemsTableViewCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.none
        backgroundColor = UIColor.clear
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        let backgroundImg = UIImageView()
        backgroundImg.image = UIImage(named: "tishi_line_04")
        contentView.addSubview(backgroundImg)
        
        backgroundImg.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
        
        titleL.font = UIFont.QXyingbikai(size: 20)
        titleL.textColor = UIColor.black
        contentView.addSubview(titleL)
        titleL.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.height.equalTo(30)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
        authorL.textColor = UIColor.lightGray
        authorL.font = UIFont.QXyingbikai(size: 15)
        authorL.textAlignment = .center
        contentView.addSubview(authorL)
        authorL.snp.makeConstraints { (make) in
            make.top.equalTo(titleL.snp.bottom).offset(15)
            make.height.equalTo(20)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
        tagsL.textColor = UIColor.lightGray
        tagsL.font = UIFont.QXyingbikai(size: 15)
        tagsL.textAlignment = .center
        contentView.addSubview(tagsL)
        
        contentL.textColor = UIColor.black
        contentL.font = UIFont.QXyingbikai(size: 25)
        contentL.textAlignment = .left
        contentL.numberOfLines = 0
        contentView.addSubview(contentL)
        contentL.snp.makeConstraints { (make) in
            make.top.equalTo(authorL.snp.bottom).offset(15)
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.bottom.equalTo(tagsL.snp.top).offset(-15)
        }
        
       
        tagsL.snp.makeConstraints { (make) in
            make.left.equalTo(contentL.snp.left)
            make.height.equalTo(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
        }
    }

    func configureCell(poem: HCPoemModel) {
        titleL.text = poem.poem_title
        authorL.text = "\(poem.poem_dynasty)：\(poem.poem_author)"
        contentL.text = poem.poem_content.components(separatedBy: "\n").first ?? ""
        tagsL.text = poem.poem_tags.joined(separator: "，")
    }
}
