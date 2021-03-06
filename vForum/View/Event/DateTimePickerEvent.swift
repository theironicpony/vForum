//
//  DateTimePickerEvent.swift
//  vForum
//
//  Created by Phúc Lý on 9/23/20.
//  Copyright © 2020 vinova.internship. All rights reserved.
//

import Foundation
import UIKit


extension DateTimePickerEvent {
    
    func initializeCancelBtn(_ cancelBtn: inout UIButton?) {
        cancelBtn = UIButton()
        guard let cancelBtn = cancelBtn else {
            return
        }
        view.addSubview(cancelBtn)
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        cancelBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height * 0.04).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.2).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.06).isActive = true
        
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.setTitleColor(.red, for: .normal)
        cancelBtn.titleLabel?.font = UIFont(name: "Futura", size: self.view.bounds.height * 0.06 * 0.4)
        cancelBtn.addTarget(self, action: #selector(cancelBtnPressed(_:)), for: .touchUpInside)
    }
    
    func initializeSaveBtn(_ saveBtn: inout UIButton?) {
        saveBtn = UIButton()
        guard let saveBtn = saveBtn else {
            return
        }
        view.addSubview(saveBtn)
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        saveBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height * 0.04).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.2).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.06).isActive = true
        
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.setTitleColor(UIColor(red: 39/255, green: 93/255, blue: 173/255, alpha: 1.0), for: .normal)
        saveBtn.titleLabel?.font = UIFont(name: "Futura", size: self.view.bounds.height * 0.06 * 0.4)
        saveBtn.addTarget(self, action: #selector(saveBtnPressed(_:)), for: .touchUpInside)
    }
    
    func initilizeDateTimeArea(stackView: inout UIStackView?, label: inout UILabel?, datePicker: inout UIDatePicker?, _ topConstant: CGFloat, _ textLabel: String) {
        stackView = UIStackView(frame: .zero)
        label = UILabel()
//        datePicker = UIDatePicker()
        
        guard let stackView = stackView, let label = label, let datePicker = datePicker else {
            return
        }
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(datePicker)
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: topConstant).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.05).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -self.view.bounds.width * 0.05).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.3).isActive = true
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.3 * 0.1).isActive = true
        label.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        label.text = textLabel
        
        datePicker.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
    }
}

