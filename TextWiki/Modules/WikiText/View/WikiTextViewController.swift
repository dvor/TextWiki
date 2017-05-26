//
//  WikiTextViewController.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit
import SnapKit

class WikiTextViewController: UIViewController {
    var output: WikiTextViewOutput!

    fileprivate var textView: UITextView!
    fileprivate var textViewBottomConstraint: Constraint!

    init() {
        super.init(nibName: nil, bundle: nil)

        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        createSubviews()
        installConstraints()

        output.viewIsReady()


        // let recognizer = UITapGestureRecognizer(target: self, action: #selector(qqq(recognizer:)))
        // recognizer.numberOfTapsRequired = 1
        // textView.addGestureRecognizer(recognizer)
    }

    // func qqq(recognizer: UITapGestureRecognizer) {
    //     var location = recognizer.location(in: textView)
    //     location.y += textView.contentOffset.y

    //     let tapPosition = textView.closestPosition(to: location)
    //     print(tapPosition)
    // }
}

extension WikiTextViewController: WikiTextViewInput  {
    var text: String {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
        }
    }

    func set(textObjects: [WikiTextViewTextObject], in changedRange: NSRange) {
        textView.textStorage.removeAttribute(NSForegroundColorAttributeName, range: changedRange)

        for object in textObjects {
            switch object.type {
                case .link:
                    textView.textStorage.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: object.range)
            }
        }
    }
}

// Notifications
extension WikiTextViewController {
    func keyboardWillShow(notification: Notification) {
        handleKeyboardNotification(notification, willShow: true)
    }

    func keyboardWillHide(notification: Notification) {
        handleKeyboardNotification(notification, willShow: false)
    }
}

extension WikiTextViewController: NSTextStorageDelegate {
    func textStorage(_ textStorage: NSTextStorage,
            willProcessEditing editedMask: NSTextStorageEditActions,
            range editedRange: NSRange,
            changeInLength delta: Int) {
        output.willProcessEditing(string: textStorage.string, range: editedRange, changeInLength: delta)
    }
}

extension WikiTextViewController {
    func createSubviews() {
        textView = UITextView()
        textView.textStorage.delegate = self
        textView.font = UIFont(name: "Menlo-Regular", size: 18.0)
        view.addSubview(textView)
    }

    func installConstraints() {
        textView.snp.makeConstraints {
            $0.top.left.right.equalTo(view)
            self.textViewBottomConstraint = $0.bottom.equalTo(view).constraint
        }
    }

    func handleKeyboardNotification(_ notification: Notification, willShow: Bool) {
        let userInfo = notification.userInfo!

        let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let curve = UIViewAnimationCurve(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue)!

        let options: UIViewAnimationOptions

        switch curve {
            case .easeInOut:
                options = UIViewAnimationOptions()
            case .easeIn:
                options = .curveEaseIn
            case .easeOut:
                options = .curveEaseOut
            case .linear:
                options = .curveLinear
        }

        UIView.animate(withDuration: duration, delay: 0.0, options: options, animations: { [unowned self] in
                self.textViewBottomConstraint.update(offset: willShow ? -frame.size.height : 0.0)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
