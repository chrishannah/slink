//
//  main.swift
//  slink
//
//  Created by Christopher Hannah on 23/03/2017.
//  Copyright © 2017 Christopher Hannah. All rights reserved.
//

import Foundation


let urlShortener = URLShortener()

let arguments = CommandLine.arguments

var message = "You're holding it wrong!"

func printResult(result: String) -> String {
    if result == "" || result == "error" {
        return message
    }
    return result
}

func printUsage() {
    print("Usage: slink [options] <url>")
    print("")
    print("Options:")
    print("")
    print("    -h, --help              Outputs usage information.")
    print("    -s, --shortern <url>    Shortens a given URL.")
    print("    -e, --expand <url>      Attempts to expand a given URL.")
    print("")
    print("Example:")
    print("")
    print("    slink -s \"http://google.co.uk\"")
    print("")
}

switch arguments.count {
case 2:
    if (arguments[1] == "-h" || arguments[1] == "--help") {
        printUsage()
    } else {
        // Defalt to Expanding the URL given
        message = "🔗" + urlShortener.shortenURL(longURL: arguments[1])
        print(message)
    }
    
    break
case 3:
    // Hopefully a proper option has been supplied
    if (arguments[1] == "-s" || arguments[1] == "--shorten") {
        message = "🔗" + urlShortener.shortenURL(longURL: arguments[2])
        print(message)
    } else if (arguments[1] == "-e" || arguments[1] == "--expand") {
        message = "🌍" + urlShortener.expandURL(shortURL: arguments[2])
        print(message)
    } else {
        print(message)
    }
    break
default:
    print(message)
    break
}



