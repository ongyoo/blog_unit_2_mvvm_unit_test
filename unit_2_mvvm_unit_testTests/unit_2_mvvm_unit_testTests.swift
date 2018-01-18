//
//  unit_2_mvvm_unit_testTests.swift
//  unit_2_mvvm_unit_testTests
//
//  Created by Komsit Chusangthong on 1/15/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import XCTest
@testable import unit_2_mvvm_unit_test

class unit_2_mvvm_unit_testTests: XCTestCase {
    var viewModel: MainInterface!
    var service: MainMockService!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_saveMessageData_Should_Text_Success() {
        viewModel = MainViewModel(service: MainService())
        viewModel.output.showMessageAlert =  { message in
            XCTAssert(true)
        }
        
        viewModel.output.didError = {
            XCTFail()
        }
        viewModel.input.saveMessageData(message: "test")
    }
    
    func test_saveMessageData_Should_Nil_Fail() {
        viewModel = MainViewModel(service: MainService())
        viewModel.output.showMessageAlert =  { message in
            XCTFail()
        }
        
        viewModel.output.didError = {
            XCTAssert(true)
        }
        
        viewModel.input.saveMessageData(message: nil)
    }
    
    func test_GetBitCoinNews_Success() {
        viewModel = MainViewModel(service: MainMockService(statusCode: 200))
        viewModel.output.didSuccessBitCoinNews = {articles in
            XCTAssert(true)
        }
        
        viewModel.output.didErrorBitCoinNews = {error in
            XCTFail()
        }
        
        viewModel.input.getBitCoinNews()
    }
    
    func test_GetBitCoinNews_Fail() {
        viewModel = MainViewModel(service: MainMockService(statusCode: 400))
        viewModel.output.didSuccessBitCoinNews = { articles in
            XCTFail()
        }
        
        viewModel.output.didErrorBitCoinNews = { error in
            XCTAssert(true)
        }
        viewModel.input.getBitCoinNews()
    }
}


class MainMockService: MainServiceInterface {
    var errorCode = 200
    var status = "success"
    var isFail = false
    
    enum MainError: Error {
        case noData
        case unKnown
    }
    
    init(statusCode: Int) {
        errorCode = statusCode
        isFail = false
        if statusCode > 300 {
            status = "Fail"
            isFail = true
        }
    }
    
    func getBitCoinNews(completion: @escaping (ArticleResponse?) -> Void, failure: @escaping (Error) -> Void) {
        let response = ArticleResponse()
        if isFail {
            failure(MainError.unKnown)
            return
        }
        
        response.status = status
        response.totalResults = isFail ? 0:5
        response.articles = mockArticle()
        completion(response)
    }
    
    func mockArticle() -> [ArticleModel] {
        var items = [ArticleModel]()
        for index in 1...5 {
            let model = ArticleModel()
            model.author = "author-\(index)"
            model.des = "Des-\(index)"
            model.title = "title-\(index)"
            model.url = "URL-\(index)"
            model.urlToImage = "URLToImage-\(index)"
            items.append(model)
        }
        
        return items
    }
}
