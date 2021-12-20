//
//  VehiclesViewControllerTests.swift
//  ChallengeWebmotorsTests
//
//  Created by Leonardo Portes on 20/12/21.
//

import Foundation
import XCTest

@testable import ChallengeWebmotors

final class VehiclesViewControllerTests: XCTestCase {
    
    // MARK: - Tests cases
    
    func test_tableview_should_has_datasource() {
        let sut = makeSut()
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func test_tableview_should_has_delegate() {
        let sut = makeSut()
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func test_tableview_number_of_sections() {
        let sut = makeSut()
        let amout = sut.tableView.numberOfSections
        XCTAssertEqual(amout, 1, "Should correct numbers of section in tableview")
    }
    
    func test_tableview_number_of_cell_in_section() {
        let sut = makeSut()
        let amout = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(amout, sut.vehicles.count)
    }
    
}

// MARK: - Extensions

extension VehiclesViewControllerTests {
    
    func makeSut() -> VehiclesViewController {
        let sut = VehiclesViewController()
        sut.viewDidLayoutSubviews()
        
        return sut
    }
}
