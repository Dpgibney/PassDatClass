//
//  Sorting.swift
//  ClassesManager
//
//  Created by Jose Carlos on 2/8/18.
//  Copyright © 2018 PassDatClass. All rights reserved.
//

/* Implemented by Jose Carlos */

import Foundation

public enum Sorting{
    case alph
    case rating
    case inversealph
    case lastnamealph
    case firstwithphoto
}

public class Sorted{
    public class func sort(by: Sorting, tutors: [Tutor]) -> [Tutor]{
        let ret = tutors.sorted {
            switch(by){
            case .lastnamealph:
                return $0.name < $1.name
            case .rating:	
                return $0.rating < $1.rating
            case .inversealph:
                let name0 = $0.name.split(separator: ",")[1]
                let name1 = $1.name.split(separator: ",")[1]
                return name0 > name1
            case .alph:
                let name0 = $0.name.split(separator: ",")[1]
                let name1 = $1.name.split(separator: ",")[1]
                return name0 < name1
            case .firstwithphoto:
                let thereisphoto0 = $0.photo != nil
                let thereisphoto1 = $1.photo != nil
                if (thereisphoto1 && !thereisphoto0){
                    return false
                }
                else{
                    return true
                }
            }
        }
        return ret
    }
    
    public class func onlyverified(tutors: [Tutor]) -> [Tutor]{
        return tutors.filter{ $0.fsuverified == true}
        
    }
}
