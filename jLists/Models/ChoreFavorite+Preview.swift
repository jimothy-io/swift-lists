//
//  ChoreFavorite+Privew.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import Foundation

extension ChoreFavorite {
    static var preview: ChoreFavorite {
        ChoreFavorite(name: "Take out trash")
    }

    static var previews: [ChoreFavorite] {
        [
            ChoreFavorite(name: "Take out trash"),
            ChoreFavorite(name: "Do laundry"),
            ChoreFavorite(name: "Wash dishes"),
            ChoreFavorite(name: "Vacuum living room"),
            ChoreFavorite(name: "Clean bathroom"),
            ChoreFavorite(name: "Water plants"),
            ChoreFavorite(name: "Change bed sheets"),
            ChoreFavorite(name: "Empty dishwasher"),
            ChoreFavorite(name: "Wipe kitchen counters"),
            ChoreFavorite(name: "Take recycling out"),
        ]
    }
}
