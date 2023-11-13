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
    
    static let questionOne = "자기 전, 배고픈 당신은?"
    static let questionTwo = "알람을 대하는 당신의 자세는?"
    static let questionThree = "하루일과를 마친 늦은 밤, 당신은?"
    static let questionFour = "당신이 선호하는 수면 메이트는?"
    
    // MARK: - answer
    
    static let firstAnswerList = ["배달 앱을 켜고 야식을 시킨다.", "몸에 좋지 않아! 꾹 참는다.", "집에 있는 음식을 찾아 먹는다.", "가벼운 간식으로 대체!"]
    static let secondAnswerList = ["알람 따위 필요없어!", "1-2번 알람 후 기상", "10분, 30분… n번 후 기상", "10개 중 9개는 못 듣는 잠꾸러기"]
    static let thirdAnswerList = ["얼마나 잘 수 있지? 후다닥 잔다.", "책, 차, 향초.. 분위기 낼 건 내야지.", "기다렸어, 핸드폰 타임 시작", "일을 좀더 하다 자자 :("]
    static let fourthAnswerList = ["따뜻하게 안아줄 죽부인 메이트", "불도 꺼주고, 방문도 닫아줄 손발 메이트", "아침에 물을 뿌려줄 기상 메이트", "옆에 누가 있으면 절대 잘 수 없어!"]
    
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
