//
//  TextLiteral.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/26.
//

import Foundation

enum TextLiteral {
    
    // MARK: - title
    
    static let questionViewControllerTitle = "수면 요정 찾기 테스트"
    
    // MARK: - question
    
    static let questionOne = "자기 전에 배고픈 당신은?"
    static let questionTwo = "알람을 대하는 내 기상 태도는?"
    static let questionThree = "아침에 일어났을 때 나의 자세는?"
    static let questionFour = "나에게 가장 필요한 수면 메이트는?"
    
    // MARK: - answer
    
    static let firstAnswerList = ["배달 앱을 켜고 야식을 시킨다.", "몸에 좋지 않아! 꾹 참는다.", "집에 있는 음식을 찾아 먹는다."]
    static let secondAnswerList = ["알람 따위 필요없어! 알람 전 기상", "1-2번 알람 후 기상", "10분, 30분, 한 시간 간격의 여러 알람 후 기상", "알람 100개 중에 90개는 못 듣는 침대 껌딱지"]
    static let thirdAnswerList = ["잠들기 전과 똑같은 정자세", "조금 흐트러져 있는 정도", "베개가 왜 발밑에? 위아래 뒤집기", "침대를 벗어난 몽유병 보유자"]
    static let fourthAnswerList = ["자기 전 따뜻하게 안아줄 메이트", "불도 꺼주고, 방문도 닫아줄 손발 메이트", "아침에 물을 뿌려줄 기상 메이트", "옆에 누가 있으면 절대 잘 수 없어!"]
    
    // MARK: - button
    
    static let nextButtonTitle = "다음"
    static let endTestButtonTitle = "결과 확인하기"
    
    // MARK: - ResultView
    
    enum ResultView {
        static let routineBeforeArray = ["미션 시작 시간 지키기", "방 불 끄기", "물 떠놓기", "양치 및 세수 하기"]
        static let routineAfterArray = ["기상 시간 지키기", "핸드폰 사용하지 않기", "떠놓은 물 마시기", "밝은 빛 보기 - 커튼 열기"]
        static let subTitleText = "당신의 수면 타입은"
        static let routineText = "당신을 위한 추천 수면 루틴"
        static let mainButtonText = "규칙적인 수면 시작하기"
        static let routineHeaderBefore = "수면 전"
        static let routineHeaderAfter = "수면 후"
    }
}
