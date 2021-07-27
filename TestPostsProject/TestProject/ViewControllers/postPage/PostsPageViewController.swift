//
//  PostsPageViewController.swift
//  BeingMe
//
//  Created by Kavya Mangala muppidi on 7/20/21.
//

import UIKit

class PostsPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var postsData: PostsData?
    //var postsData: PostsData?
    override func viewDidLoad() {
        super.viewDidLoad()
                tableView.dataSource = self
                tableView.delegate = self
        
        tableView.register(UINib(nibName: "HeaderViewTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderViewTableViewCell")
        
        // Do any additional setup after loading the view.
        //        http://35.223.52.208/api/posts?pageSize=6&comPageSize=4
        let apiKeys = ["pageSize": "1", "pageNumber": "0"]
        PostsApiManager.shared.getPostsAPI(param: apiKeys) { response, status in
            if let postsData = response as? PostsData {
                print("\(postsData)")
                DispatchQueue.main.async {
                    self.postsData = postsData
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension PostsPageViewController: UITableViewDelegate {
    
}

extension PostsPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData?.content?.count ?? 0
            //postsData?.content?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderViewTableViewCell", for: indexPath) as? HeaderViewTableViewCell
        if let items = postsData?.content {
            cell?.configurePostData(postsContent: items[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            return UIView()
//        }
//
//        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//            let footerView = tableView.dequeueReusableCell(withIdentifier: "CommentsView") as? CommentsView
//            return footerView ?? UITableViewCell()
//        }
    
}
