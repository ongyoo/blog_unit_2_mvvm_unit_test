//
//  MainInteractor.swift
//  unit_1_mvvm
//
//  Created by Komsit Chusangthong on 1/10/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import Foundation

// MARk - Data-binding
protocol MainInteractorInput {
    func saveMessageData(message: String?)
    
    // MARK : - Input GET Service
    func getBitCoinNews()
}

protocol MainInteractorOutput: class {
    var articles: [ArticleModel]? { get }
    
    // Event
    var showMessageAlert: ((String) -> Void)? { get set }
    var didError: (() -> Void)? { get set }
    
    // MARK : - Output Service
    var didSuccessBitCoinNews: ((ArticleResponse?) -> Void)? { get set }
    var didErrorBitCoinNews: ((Error) -> Void)? { get set }
}

protocol MainInterface: MainInteractorInput, MainInteractorOutput {
    var input: MainInteractorInput { get }
    var output: MainInteractorOutput { get }
}

protocol MainServiceInterface: class {
    func getBitCoinNews(completion: @escaping (ArticleResponse?)-> Void ,failure: @escaping (Error)-> Void)
}
