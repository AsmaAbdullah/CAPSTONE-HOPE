//
//  APIVideoVC.swift
//  HOPE
//
//  Created by Asma on 28/12/2021.
//

import UIKit

class APIVideoVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    
    
    
    var model = Model()
    var videos = [Video]()
    
    @IBOutlet weak var videoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
        
        //MARK: Set itself as the datasource and the delegate
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        //MARK: Set itself as the delegate of the model
        model.delegate = self
    }
    //MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        //MARK: Set the returend videos to our video property
        self.videos =  videos
        //MARK: Refresh the tablevIEW
        self.videoTableView.reloadData()
        
        //        DispatchQueue.main.async {
        //        }
    }
    
    //MARK: TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoTableViewCell
        
        //MARK: Configure the cell with the data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        //MARK: Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetailVideo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //MARK: Confirm that a video was selected
        guard videoTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //MARK: Get a reference to the video that was tapped on
        let selectedVideo = videos[videoTableView.indexPathForSelectedRow!.row]
        
        //MARK: Get a reference to the detail VC
        let vc = segue.destination as! VideoDetailVC
        
        //MARK: Set the video property of the detail VC
        vc.video = selectedVideo
        
    }
    
    
}
