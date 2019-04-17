// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 17/04/2019.
//  All code (c) 2019 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public struct Result {
    public let code: Int32
    public let description: String
    
    public init(_ code: Int32, _ description: String) {
        self.code = code
        self.description = description
    }
    
    public static let ok = Result(0, "The arguments were ok and the command executed successfully.")
    public static let unknownCommand = Result(1, "The command was unknown.")
    public static let badArguments = Result(3, "There was an error parsing the arguments.")
    public static let runFailed = Result(4, "Launching a sub-command failed.")

}
