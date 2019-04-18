// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 18/04/2019.
//  All code (c) 2019 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

struct XcodeArchive {
    let build: String
    let version: String
    let name: String
    let shortName: String
    let lowername: String
    
    init?(url: URL) {
        let infoURL = url.appendingPathComponent("Info.plist")
        guard let data = try? Data(contentsOf: infoURL), let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil), let info = plist as? [String:Any] else {
            return nil
        }
        
        guard
            let appInfo = info["ApplicationProperties"] as? [String:Any],
            let appPath = appInfo["ApplicationPath"] as? String,
            let build = appInfo["CFBundleVersion"] as? String,
            let version = appInfo["CFBundleShortVersionString"] as? String
            else {
                return nil
        }
        
        self.init(version: version, build: build, path: appPath)
    }
    
    init(version: String, build: String, path: String) {
        self.build = build
        self.version = version
        let url = URL(fileURLWithPath: path)
        self.name = url.lastPathComponent
        self.shortName = url.deletingPathExtension().lastPathComponent
        self.lowername = shortName.lowercased()
    }
    
    var versionedZipName: String {
        return "\(lowername)-\(version)-\(build).zip"
    }
    
    var unversionedZipName: String {
        return "\(lowername).zip"
    }
}