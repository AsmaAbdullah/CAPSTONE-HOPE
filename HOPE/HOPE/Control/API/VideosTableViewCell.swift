//
//  VideosTableViewCell.swift
//  HOPE
//
//  Created by Asma on 10/01/2022.
//

import UIKit
import WebKit

class VideosTableViewCell: UITableViewCell {
    
    var video: Video?
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        webView.layer.cornerRadius = 12
        webView.layer.borderColor = UIColor.lightGray.cgColor
        webView.layer.borderWidth = 1.0
        
        //Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        
        
        //Chech if there's a video
        guard video != nil else {
            return
        }
        
        //Create the embed URL
//        let embedUrlString = "https://www.youtube.com/embed/" + video!.videoId
        
        //Load it into webview
        let url = URL(string: "https://www.youtube.com/embed/" + video!.videoId)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //Set the title
        
        titleLabel.text = video!.title
        
        //Set the date
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        //Set the title label
        self.titleLabel.text = video?.title
        
        //Set the data
//        let df = DateFormatter()
//        df.dateFormat = "EEEE, MMM d, yyyy"
//        self.dateLabel.text = df.string(from: video!.published)
        
        //Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //Check Cache before downloading data
//        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
//            //Set the thumbnail imageview
//            self.thumbnailImageView.image = UIImage(data: cacheData)
//            return
//        }
        
        //Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL Session object
        let session = URLSession.shared
        
        //Data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                
                //Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check that the downloaded url matches the video thumbnail url that cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    //Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                //Create image object
//                let image = UIImage(data: data!)
                //Set the imageview
//                DispatchQueue.main.async {
//                    self.thumbnailImageView.image = image
//                }
            }
        }
        //Start data task
        dataTask.resume()
    }

}
