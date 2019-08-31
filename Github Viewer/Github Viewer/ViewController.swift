//
//  ViewController.swift
//  Github Viewer
//
//  Created by 김도현 on 21/08/2019.
//  Copyright © 2019 김도현. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var list = [repo]()

    
    
    func getData() {
        var request = URLRequest(url: URL(string: "https://api.github.com")!)
        request.addValue("2f3f62e9847d43410ffbf76fbd5633ea49fed7e5", forHTTPHeaderField: "")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){
            [weak self] data, res, err in
            guard self != nil else { return }
            if let err = err { print(err.localizedDescription); return }
            print((res as! HTTPURLResponse).statusCode)
            switch (res as! HTTPURLResponse).statusCode{
            case 200:
                let jsonSerialization = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                print(jsonSerialization)
                print(jsonSerialization["current_user_url"]!)
            default:
                print("error")
            }
            }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = "\(JSONSerialization.self)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row)")
    }
}




class repo: UITableViewCell {
    var repoName : String?
}



