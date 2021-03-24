//
//  NetworkService.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation

class NetworkService {
    func loadData(from url: URL, completion: @escaping (_ data: Data?,_ error: Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url)
            { (data, response, error) in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            }
        task.resume()
    }
}
