//
//  FeedDetailViewController.swift
//  vForum
//
//  Created by CATALINA-ADMIN on 9/21/20.
//  Copyright © 2020 vinova.internship. All rights reserved.
//

import UIKit
import SnapKit

class FeedDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var reuseFeedCardDetail: ReuseFeedCard!
    @IBOutlet weak var viewContain: UIView!
    @IBOutlet weak var tableViewSomeComments: UITableView!
    @IBOutlet weak var btnShowAllCmt: UIButton!
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    var number = 0
    var isLiked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSomeComments.delegate = self
        tableViewSomeComments.dataSource = self
        tableViewSomeComments.register(UINib(nibName: "FeedDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedDetailTableViewCell")
        self.navigationItem.title = "Detail"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.number = 4
            self.tableViewSomeComments.reloadData()
        }
        reuseFeedCardDetail.commentAction = {
            let vc = FeedCommentViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        reuseFeedCardDetail.clickLike = {
            if self.isLiked {
                self.reuseFeedCardDetail.imageLiked.setImage(UIImage(named: "unlike"), for: .normal)
                self.isLiked = false
            }
            else {
                self.reuseFeedCardDetail.imageLiked.setImage(UIImage(named: "like"), for: .normal)
                self.isLiked = true
            }
        }
        reuseFeedCardDetail.toZoomScene = {
            let vcShowImageView = ShowImageViewController()
            //vcShowImageView.setImage(UIImage(named: "AppIcon")!)
            if #available(iOS 13.0, *) {
                vcShowImageView.image = UIImage(systemName: "person.circle.fill")
            } else {
                // Fallback on earlier versions
            }
            self.navigationController?.pushViewController(vcShowImageView, animated: true)
        }
        reuseFeedCardDetail.moreAction = {
            self.showMoreSheet()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SHOWALLCMT(_ sender: Any) {
        let vc = FeedCommentViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FeedDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FeedDetailTableViewCell") as? FeedDetailTableViewCell {
            cell.reuseComment.moreAction = {
                self.showMoreSheetComment()
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.tableViewSomeComments.layoutIfNeeded()
        self.heightTableView.constant = self.tableViewSomeComments.contentSize.height
    }
}

extension FeedDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension FeedDetailViewController {
    func showMoreSheet() {
        let alert = UIAlertController(title: "More", message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Edit", style: .default , handler:{ (UIAlertAction)in
            print("User click Edit")
        }))

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction)in
            print("User click Delete")
            self.tableViewSomeComments.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Cancel")
            self.tableViewSomeComments.reloadData()
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func showMoreSheetComment() {
        let alert = UIAlertController(title: "More", message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Edit", style: .default , handler:{ (UIAlertAction)in
            print("User click Edit")
        }))

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction)in
            print("User click Delete")
            self.tableViewSomeComments.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Cancel")
            self.tableViewSomeComments.reloadData()
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
