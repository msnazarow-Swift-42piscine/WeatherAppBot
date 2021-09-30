//
//  SectionModel.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import Foundation

final class SectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable] = []

    init(_ properties: [Model]) {
        properties.forEach { property in
            rows.append(CellModel(property))
        }
    }
}
