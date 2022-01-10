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
        
        //URL object
        let url = URL(string: "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLB46CADF62B6D3ABB&key=AIzaSyCcBlEFFevyB565S9tuYBtiYHYD_f4ihTo")
        guard url != nil else {
            return
        }
        //URLSession object
        let session = URLSession.shared
        
        //data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, erroe in
            
            //Check there were any errors
            if erroe != nil || data == nil {
                return
            }
            do {
                
                //parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    // Call the "videosFetched" method of the delegate
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                //                dump(response)
            } catch {
                
            }
            
        }
        // Kick off the task
        dataTask.resume()
    }
}
