//
//  Extensions.swift
//  slink
//
//  Created by Christopher Hannah on 23/03/2017.
//  Copyright © 2017 Christopher Hannah. All rights reserved.
//

import Foundation

extension String {
    
    // http://stackoverflow.com/a/1455639/17279
    var URLEncodedString: String {
        let customAllowedSet = CharacterSet(charactersIn:":/?#[]@!$&'()*+,;=").inverted
        return addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
    }
}
