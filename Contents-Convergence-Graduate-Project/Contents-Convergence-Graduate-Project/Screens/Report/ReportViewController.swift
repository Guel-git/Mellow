//
//  ReportViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/31.
//

import UIKit

import HealthKit

final class ReportViewController: BaseViewController {
    
    // MARK: - property

    private let healthStore = HKHealthStore()
    private let typeToRead = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAuthorization()
    }
    
    // MARK: - func
    
    private func requestAuthorization() {
        if HKHealthStore.isHealthDataAvailable() {
            let authorizationStatus = healthStore.authorizationStatus(for: typeToRead!)
            switch authorizationStatus {
            case .notDetermined:
                self.healthStore.requestAuthorization(toShare: nil, read: Set([typeToRead!])) { success, error in
                    if error != nil {
                        print(error.debugDescription)
                    } else {
                        if success { self.getSleepData() }
                    }
                }
            case .sharingDenied:
                self.makeAlert(title: "건강 앱에 접근할 수 없음", message: "설정에서 건강 앱 접근을 허용해 주세요.")
            case .sharingAuthorized:
                self.getSleepData()
            }
        } else {
            self.makeAlert(title: "건강 앱을 사용할 수 없음", message: "iOS 또는 iPadOS의 버젼 17 이후만 사용 가능합니다.")
        }
        
    }
    
    private func getSleepData() {
        let start = "2023-10-15".stringToDate()
        let end = Date()
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: typeToRead!, predicate: predicate, limit: 10, sortDescriptors: [sortDescriptor]) { query, sleepResult, error -> Void in
            if error != nil { return }
            if let result = sleepResult as? [HKCategorySample] {
                result.forEach { print($0.startDate, $0.endDate) }
            }
        }
        healthStore.execute(query)
    }
}
