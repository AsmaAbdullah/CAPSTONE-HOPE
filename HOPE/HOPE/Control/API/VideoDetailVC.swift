//
//  VideoDetailVC.swift
//  HOPE
//
//  Created by Asma on 28/12/2021.
//

import UIKit
import WebKit

class VideoDetailVC: UIViewController {
    
    var video: Video?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.layer.cornerRadius = 12
        webView.layer.borderColor = UIColor.lightGray.cgColor
        webView.layer.borderWidth = 1.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //MARK: Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
        //MARK: Chech if there's a video
        guard video != nil else {
            return
        }
        
        //MARK: Create the embed URL
        //        let embedUrlString = "https://www.youtube.com/embed/" + video!.videoId
        
        //MARK: Load it into webview
        let url = URL(string: "https://www.youtube.com/embed/" + video!.videoId)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //MARK: Set the title
        
        titleLabel.text = video!.title
        
        //MARK: Set the date
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //MARK: Set the description
        
        textView.text = video!.description
        
    }
    
    
    
}
