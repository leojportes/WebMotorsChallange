//
//  VehiclesSnapshotTests.swift
//  ChallengeWebmotorsTests
//
//  Created by Leonardo Portes on 20/12/21.
//

import Foundation
import XCTest
import FBSnapshotTestCase

@testable import ChallengeWebmotors

final class VehiclesSnapshotTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
    // recordMode = true
    }
    
    /// Snapshot with problem: Snapshot is being taken before screen construction. Solution is to build a mocked screen, with mocked data, so there will be no delay in building the screen.
//    func test_view_layout() {
//        let expectation = self.expectation(description: "")
//        let sut = makeSut()
//        sut.viewDidLayoutSubviews()
//        FBSnapshotVerifyView(sut.view)
//        expectation.fulfill()
//
//    }
}

extension VehiclesSnapshotTests {
    
    func makeSut() -> VehiclesViewController {
        let sut = VehiclesViewController()
        sut.viewDidLayoutSubviews()
        return sut
    }
}
