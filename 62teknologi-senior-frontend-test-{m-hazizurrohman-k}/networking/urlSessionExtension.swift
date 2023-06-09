//
//  urlSessionExtension.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation


extension URLSession {
    /**
     `getAllBusiness` will asynchronously call Yelp endpoint and return complete list of the available business from yelp within first `20` list
     */
    func getAllBusiness(request: URLRequest, completion: @escaping (Result<BusinessSearchResultType, Error>) -> Void) {
        self.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(BusinessSearchResultType.self, from: data)
                    completion(.success(results))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
    
    /**
     `getBusinessById` will asynchronously call Yelp endpoint and return business details from the given `id`
     */
    func getBusinessById(request: URLRequest, completion: @escaping (Result<BusinessDetailsType, Error>) -> Void) {
        self.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(BusinessDetailsType.self, from: data)
                    completion(.success(results))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
    
    /**
     `getBusinessReviewsById` will asynchronously call Yelp endpoint and return top 3 reviews from the given business id
     */
    func getBusinessReviewsById(request:URLRequest, completion: @escaping (Result<BusinessReviewsType, Error>)->Void) {
        self.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(BusinessReviewsType.self, from: data)
                    completion(.success(results))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }

}
