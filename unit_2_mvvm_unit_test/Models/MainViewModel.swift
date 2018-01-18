//
//  MainViewControllerViewModel.swift
//  unit_1_mvvm
//
//  Created by Komsit Chusangthong on 1/10/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import UIKit

class MainViewModel: MainInterface, MainInteractorOutput {
    var articles: [ArticleModel]?
    
    var input: MainInteractorInput { return self }
    var output: MainInteractorOutput { return self }
    
    // MARK - Data-binding OutPut
    var showMessageAlert: ((String) -> Void)?
    var didError: (() -> Void)?
    
    // MARK : - OutPut News
    var didSuccessBitCoinNews: ((ArticleResponse?) -> Void)?
    var didErrorBitCoinNews: ((Error) -> Void)?
    
    
    // MARK : - Init
    var service: MainServiceInterface!
    convenience init(service: MainServiceInterface) {
        self.init()
        self.service = service
    }
}

// MARK - Data-binding InPut
extension MainViewModel: MainInteractorInput {
    func saveMessageData(message: String?) {
        guard let msg = message,
            !msg.isEmpty,
             msg != "" else {
            didError?()
            return
        }
        showMessageAlert?(msg)
    }
    
    func getBitCoinNews() {
        service.getBitCoinNews(completion: { [weak self] (news) in
            guard let weakSelf = self else { return }
            weakSelf.articles = news?.articles
            weakSelf.didSuccessBitCoinNews?(news)
        }) { [weak self] (error) in
            guard let weakSelf = self else { return }
            weakSelf.didErrorBitCoinNews?(error)
        }
    }
}
