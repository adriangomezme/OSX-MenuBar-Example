//
//  QuotesViewController.swift
//  MenuBar
//
//  Created by Adrian Gomez on 5/21/16.
//  Copyright © 2016 Elaniin Digital. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    @IBOutlet weak var textLabel: NSTextField!
    let quotes = Quote.all
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        textLabel.stringValue = String(quotes[currentQuoteIndex])
    }
}

// MARK: Actions

extension QuotesViewController {
    @IBAction func goLeft(sender: AnyObject) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    @IBAction func goRight(sender: AnyObject) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count

    }
    @IBAction func quit(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(sender)
    }

}