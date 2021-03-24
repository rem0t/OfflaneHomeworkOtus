//
//  Error.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

enum NSEntityDescriptionError: Error {
  case cantCreateDescriptionForEntityName
}
