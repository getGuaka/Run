import XCTest

import RunTests

var tests = [XCTestCaseEntry]()
tests += RunTests.allTests()
XCTMain(tests)