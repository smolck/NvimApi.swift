import XCTest

import NvimApiTests

var tests = [XCTestCaseEntry]()
tests += NvimApiTests.allTests()
XCTMain(tests)
