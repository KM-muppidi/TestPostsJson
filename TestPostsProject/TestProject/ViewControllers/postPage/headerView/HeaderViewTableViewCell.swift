//
//  HeaderViewTableViewCell.swift
//  BeingMe
//
//  Created by Kavya Mangala muppidi on 7/20/21.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class HeaderViewTableViewCell: UITableViewCell {
    
    //Mark : Stack Views IBOutlets
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var useranameStackView: UIStackView!
    @IBOutlet weak var footerStackView: UIStackView!
    @IBOutlet weak var likesStackView: UIStackView!
    @IBOutlet weak var commentsStackView: UIStackView!
    
    //Mark : IBOutlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var postImage:  UIImageView!
    @IBOutlet weak var likesNumberLabel: UILabel!
    @IBOutlet weak var likeslabel: UILabel!
    @IBOutlet weak var commentsNumberLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurePostData(postsContent: PostsContent?) {
        usernameLabel.text = postsContent?.author?.username
        likesNumberLabel.text = "\((postsContent?.likeCount)!)"
        commentsNumberLabel.text = "\((postsContent?.comments)!)"
        profileImageView.downloaded(from: (postsContent?.author?.profileImageURL)!)
        postImage.downloaded(from: (postsContent?.imageURL)!)
    }
}
