//
//  ViewController.swift
//  UIPickerView
//
//  Created by home on 2018/02/10.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

// UIPickerViewのデリゲートプロトコルとデータソースの宣言を追加する
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // PickerViewのプロパティ宣言
    @IBOutlet weak var myPickerView: UIPickerView!
    
    // コンポーネントに表示する項目名
    let compos = [["月","火","水","木","金"],["早朝","午前中","昼間","夜間"]]
    
    // PickerViewのコンポーネントの個数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    // 各コンポーネントの行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]
        return compo.count
    }
    
    // 各コンポーネントの横幅を返す
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    if component == 0 {
        // 月〜金
        return 50
    } else {
        // 時間帯
        return 100
    }
}

// 指定のコンポーネント、行の項目名を返す
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    // 指定のコンポーネントから指定行の項目名を取り出す
    let item = compos[component][row]
    return item
}

// ドラムが回転して項目が選ばれた
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
{
    // 選ばれた項目
    let item = compos[component][row]
    print("\(item)が選ばれた")
    
    // 現在選択されている行番号
    let row1 = pickerView.selectedRow(inComponent: 0)
    let row2 = pickerView.selectedRow(inComponent: 1)
    print("現在選択されている行番号\(row1, row2)")
    
    // 現在選択されている項目名
    let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
    let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
    print("現在選択されている項目名\(item1!, item2!)")
    print("-------------")
}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // myPickerViewのデリゲートになる
        myPickerView.delegate = self
        // myPickerViewのデータソースになる
        myPickerView.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

