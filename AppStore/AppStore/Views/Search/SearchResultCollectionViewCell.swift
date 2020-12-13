//
//  SearchResultCollectionViewCell.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/1/20.
//

import UIKit
import SDWebImage

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    var result: Result! {
        didSet{
            appNameLabel.text = result.trackName
            categoryLabel.text = result.primaryGenreName
            downloadsLabel.text = "Ratings: \(result.averageUserRating ?? 0)"
            
            let url = URL(string: result.artworkUrl100)
            appImageView.sd_setImage(with: url)
            
            screenshotOne.sd_setImage(with: URL(string: result.screenshotUrls[0]))
            if (result.screenshotUrls.count > 1){
                screenshotTwo.sd_setImage(with: URL(string: result.screenshotUrls[1]))
            }else if (result.screenshotUrls.count > 2) {
                screenshotThree.sd_setImage(with: URL(string: result.screenshotUrls[2]))
            }
        }
    }
    
    let appImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.layer.cornerRadius = 12
        imageview.clipsToBounds = true
        imageview.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return imageview
    }()
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    let downloadsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.21M"
        return label
    }()
    let getButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenshotOne = createScreenshotView()
    lazy var screenshotTwo = createScreenshotView()
    lazy var screenshotThree = createScreenshotView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //stack for labels
        let labelsStack = VerticalStackView(arrangedSubviews: [appNameLabel, categoryLabel, downloadsLabel])
        //stack for top items
        let topStack = UIStackView(arrangedSubviews: [appImageView, labelsStack, getButton])
        topStack.spacing = 12
        topStack.alignment = .center
        //stack for screenshots
        let screenshotsStack = UIStackView(arrangedSubviews: [screenshotOne, screenshotTwo, screenshotThree])
        screenshotsStack.spacing = 12
        screenshotsStack.distribution = .fillEqually
        //stack for stacks
        let stack = VerticalStackView(arrangedSubviews: [topStack, screenshotsStack])
        stack.spacing = 16
        
        contentView.addSubview(stack)
        stack.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createScreenshotView() -> UIImageView{
        let view = UIImageView()
        view.layer.cornerRadius = 12
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }

}
