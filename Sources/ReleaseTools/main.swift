// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 11/10/2018.
//  All code (c) 2018 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import Runner
import Arguments

let documentation = """
Various release utilities.

Usage:
    release archive [<scheme>]

Arguments:
    <scheme>        name of the scheme to archive

Options:

    --help          show help


Exit Status:

The coverage command exits with one of the following values:

0   If the arguments were ok and the threshold was met (or not specified).
1   If there was an error parsing the arguments.
2   If the threshold wasn't met.


"""

enum ReturnCode: Int32 {
    case ok = 0
    case unknownCommand = 1
    case badArguments = 2
    case archiveFailed = 3
    case runFailed = 4
    
    func returnStatus() -> Never {
        exit(rawValue)
    }
}

let commands = [ ArchiveCommand() ]
let args = Arguments(documentation: documentation, version: "1.0")


for command in commands {
    if args.command(command.name) {
        do {
            try command.run(arguments: args).returnStatus()
        } catch {
            ReturnCode.runFailed.returnStatus()
        }
    }
}

ReturnCode.badArguments.returnStatus()

