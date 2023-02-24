//
//  FriendInfoViewModel.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import Foundation
class FriendInfoViewModel {
    var friendsInfo: [FriendInfoModel] = []
    var otherInfo: [FriendInfoModel] = []
    func getValues(completionHandler: @escaping () -> Void) {
        var friends: [FriendInfoModel] = []
        let group = DispatchGroup()
        group.enter()
        NetworkManager.shared.fetchData(from: "https://dimanyen.github.io/friend1.json") { result in
            switch result {
            case .success(let data):
                do {
                    if let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject], let response = jsonDictionary["response"], let jsonData = try? JSONSerialization.data(withJSONObject: response) {
                        let decoder = JSONDecoder()
                        let value = try decoder.decode([FriendInfoModel].self, from: jsonData)
                        friends.append(contentsOf: value.filter({$0.status != 0}))
                    }
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
                
            case .failure(_):
                break
            }
            group.leave()
        }
        group.enter()
        NetworkManager.shared.fetchData(from: "https://dimanyen.github.io/friend2.json") { result in
            switch result {
            case .success(let data):
                do {
                    if let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject], let response = jsonDictionary["response"], let jsonData = try? JSONSerialization.data(withJSONObject: response) {
                        let decoder = JSONDecoder()
                        let value = try decoder.decode([FriendInfoModel].self, from: jsonData)
                        friends.append(contentsOf: value.filter({$0.status != 0}))
                    }
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
                
            case .failure(_):
                break
            }
            group.leave()
        }
        group.notify(queue: .main) { [weak self] in
            self?.friendsInfo = friends.sorted(by: { $0.updateDate > $1.updateDate })
                .reduce(into: [FriendInfoModel]()) { result, record in
                    if !result.contains(where: { $0.fid == record.fid }) {
                        result.append(record)
                    }
                }
            completionHandler()
        }
    }
    
    func getOtherValue(completionHandler: @escaping () -> Void){
        NetworkManager.shared.fetchData(from: "https://dimanyen.github.io/friend3.json") { result in
            switch result {
            case .success(let data):
                do {
                    if let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject], let response = jsonDictionary["response"], let jsonData = try? JSONSerialization.data(withJSONObject: response) {
                        let decoder = JSONDecoder()
                        let value = try decoder.decode([FriendInfoModel].self, from: jsonData)
                        self.friendsInfo = value.filter({$0.status != 0})
                        self.otherInfo = value.filter({$0.status == 0})
                    }
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
                
            case .failure(_):
                break
            }
            completionHandler()
        }
    }
    func getNoFriendsValue(completionHandler: @escaping () -> Void){
        NetworkManager.shared.fetchData(from: "https://dimanyen.github.io/friend4.json") { result in
            switch result {
            case .success(let data):
                break
            case .failure(_):
                break
            }
            completionHandler()
        }
    }
}
