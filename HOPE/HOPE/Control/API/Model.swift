//
//  Model.swift
//  HOPE
//
//  Created by Asma on 28/12/2021.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        //MARK: URL object
        let url = URL(string: "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLB46CADF62B6D3ABB&key=AIzaSyCcBlEFFevyB565S9tuYBtiYHYD_f4ihTo")
        guard url != nil else {
            return
        }
        //MARK: URLSession object
        let session = URLSession.shared
        
        //MARK: data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, erroe in
            
            //MARK: Check there were any errors
            if erroe != nil || data == nil {
                return
            }
            do {
                
                //MARK: parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    //MARK: Call the "videosFetched" method of the delegate
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                //                dump(response)
            } catch {
                
            }
            
        }
        //MARK: Kick off the task
        dataTask.resume()
    }
}
