//
//  Utils.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 06/07/23.
//

import Foundation

class Utils {
    private class func videoIDFromYouTubeURL(_ videoURL: URL) -> String? {
        if videoURL.pathComponents.count > 1 && ((videoURL.host?.hasSuffix("youtu.be")) ?? false) {
            return videoURL.pathComponents[1]
        } else if videoURL.pathComponents.contains("embed") {
            return videoURL.pathComponents.last
        }
        return videoURL.queryStringComponents()["v"] as? String
    }
    
    public static func getThumbnail(link:String)-> URL? {
        guard let url = URL(string: link), let videoId = self.videoIDFromYouTubeURL(url) else { return nil}
        return URL(string:"https://i.ytimg.com/vi/\(videoId)/maxresdefault.jpg")
    }
}
