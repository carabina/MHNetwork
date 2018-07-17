//
//  QuoteInteractor.swift
//  QuoteApp
//
//  Created Mohamed Emad Abdalla Hegab on 17.07.18.
//  Copyright © 2018 Mohamed Hegab. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QuoteInteractor: QuoteInteractorProtocol {

    weak var presenter: QuotePresenterProtocol?
    func getRandomQuote(onComplete: @escaping (Quote) -> Void, onError: @escaping (Error) -> Void) {
        let environment = Environment(host: "https://talaikis.com/api")
        let networkDispatcher = NetworkDispatcher(environment: environment, session: URLSession(configuration: .default))
        let quoteTask = QuoteTask<Quote>()
        quoteTask.exeute(in: networkDispatcher, completed: { (quote) in
            DispatchQueue.main.async {
                onComplete(quote)
            }
        }) { (error) in
            print(error)
        }
    }
}
