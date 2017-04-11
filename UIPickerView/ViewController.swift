//
//  ViewController.swift
//  UIPickerView
//
//  Created by 原政强 on 17/4/10.
//  Copyright © 2017年 yzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var text1: UITextField!
    var province = ["四川", "云南", "广东", "广西", "江苏"]
    var city = ["四川":["成都", "广元", "绵阳", "宜宾"], "云南":["昆明", "大理", "丽江"], "广东":["广州", "佛山", "东莞"], "广西":["桂林"], "江苏":["南京", "苏州", "徐州", "扬州", "连云港"]]
    var selectdValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView1.delegate = self
        pickerView1.dataSource = self
    }
    
    //设置所在行列内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return province[row]
        } else {
            if (city[selectdValue] != nil) {
                return city[selectdValue]![row]
            } else {
                return "?"
            }
        }
    }
    
    //选中事件
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            selectdValue = province[row]
            pickerView1.reloadComponent(1)
            pickerView1.selectRow(0, inComponent: 1, animated: true)
        }
    }
    
    // 返回要显示的列数.
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    
    
    // 返回要显示的行数
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return province.count
        } else {
            if (city[selectdValue] != nil) {
                return city[selectdValue]!.count
            } else {
                return 0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

