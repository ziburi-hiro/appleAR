//
//  SwiftUIView.swift
//  ARPersistence
//
//  Created by 松岡弘貴 on 2019/11/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SwiftUIView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView: UITableView!
    let items = [["トイレ","学部部屋","院部屋"],["トイレ","CSE","階段"],["トイレ","学習スペース","PC室"],["トイレ","コンビニ","5211教室"],["トイレ","自習室"],["トイレ","自習室"],["JR改札","名鉄改札","トイレ"]]
    let sectionName = ["名古屋工業大学2号館2階", "名古屋工業大学2号館1階", "名古屋工業大学図書館", "名古屋工業大学52号館1階", "名古屋工業大学52号館2階", "名古屋工業大学52号館3階", "名古屋駅"]
    
    var text = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = { [weak self] in
            guard let `self` = self else { return UITableView() }
            let tableView = UITableView(frame: self.view.bounds, style: .plain)
            tableView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
            tableView.delegate = self
            tableView.dataSource = self
            
            self.view.addSubview(tableView)
            
            return tableView
            }()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
    }
    
    //セクションごとの要素数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    // セクションヘッダ
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return sectionName[section]
    }
    
    //セルの生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    
    //textにパスを渡す
    func handover(_ word:String){
        text = word
    }
    
    //Segueの前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Segueの識別子確認
        if segue.identifier == "toAR" {
            //遷移先のViewController取得
            let nextView = segue.destination as! ViewController
            //値の設定
//            nextView.argString = text
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        print("front")
        handover("\(indexPath)")
        //セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "toAR", sender: nil)
    }
}
