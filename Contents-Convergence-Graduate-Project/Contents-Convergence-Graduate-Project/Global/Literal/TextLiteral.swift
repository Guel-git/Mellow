//
//  TextLiteral.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/26.
//

import Foundation

enum TextLiteral {
    
    // MARK: - common
    
    static let confirmText = "확인"
    static let startText = "시작하기"
    static let hourText = "시"
    static let minuteText = "분"
    static let secondText = "초"
    static let moringText = "오전 "
    static let afternoonText = "오후 "
    
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
        static let subTitleText = "당신의 수면 타입은"
        static let routineText = "당신을 위한 추천 수면 루틴"
        static let mainButtonText = "규칙적인 수면 시작하기"
        static let routineHeaderBefore = "수면 전"
        static let routineHeaderAfter = "수면 후"
        static let routineHeaderDuring = "수면 시작"
        
        static let bestTypeText = "수면 모범생"
        static let zombieTypeText = "잠들랑말랑 좀비"
        static let babyTypeText = "잠만보 신생아"
        static let nervousTypeText = "24시 긴장모드"
        
        static let previousAngelText = "당신의 수면요정은"
        static let afterAngelText = "예요."
        
        static let bestAngelText = "영감을 주는 재능캐"
        static let zombieAngelText = "발랄한 비타민 햇살캐"
        static let babyAngelText = "상쾌한 갓생캐"
        static let nervousAngelText = "은근히 다정한 능글캐"
            
        static let bestFavoriteText = "“이보다 더 좋아질 수 있다는 걸\n보여줄게!“"
        static let zombieFavoriteText = "“달콤한 잠을 선물해줄게요!\n자신있어요.“"
        static let babyFavoriteText = "“아침이 있는 하루\n기대되지 않아?“"
        static let nervousFavoriteText = "“걱정마\n아침만을 기다리게 만들어줄게.“"
            
        static let bestContentText = "  밤이 되면 졸리고, 아침이 되면 번쩍 눈이 떠지는 수면 모범생이군요! 완벽해보이는 당신도, 종종 늦잠의 유혹에 빠지진 않나요? 늘 새로운 시도로 주위에 영감을 주는 에이스 재능캐와 함께, 더 나은 수면 생활을 해요.\n\n  수면 전후의 습관을 잘 세우는 것만으로도, 수면의 질과 우리의 행복에 큰 영향을 미친다는 사실. 당신을 위해 꿀잠과 상쾌한 아침을 선사할 나잇 모닝 루틴 미션 패키지를 추천할게요! 메이트 최애와의 친밀도를 높여가며 루틴을 조금씩 완수해보세요."
        static let zombieContentText = "  아침에 일어났을 때, 개운하지 않아 침대에서 벗어나기 더 힘들 거예요. 조금의 빛과 소음에도 반응하는 타입, 밤중에 깨진 않나요? 편안한 잠자리로의 여정에 지치지 않게 에너지를 줄  비타민 최애를 수면 메이트로 추천할게요.\n\n  수면 전후의 습관을 잘 세우는 것만으로도, 수면의 질과 우리의 행복에 큰 영향을 미친다는 사실. 편안한 밤과 상쾌한 아침을 위한 나잇 모닝 루틴 미션 패키지를 드릴게요! 메이트 최애와의 친밀도를 높여가며 루틴을 조금씩 완수해보세요."
        static let babyContentText = "  바쁜 일상 속 잠이 최고 보상인 당신에게, 저녁과 밤은 당신만의 시간일 거예요. 남들보다 늦은 기상으로 유난히 늦은 시각 잠들기도 하네요. 상쾌한 매력으로 잠을 깨워주는 갓생캐 최애를 수면 메이트로 추천할게요.\n\n  수면 전후의 습관을 잘 세우는 것만으로도, 수면의 질과 우리의 행복에 큰 영향을 미친다는 사실. 수면 시간과 기상 시간을 지키는 데 도움이 되는 작은 루틴 패키지를 준비했어요. 메이트 최애와의 친밀도를 높여가며 루틴을 조금씩 완수해보세요."
        static let nervousContentText = "  어쩌다 늦잠을 자거나 침대에서 늦게 나오는 날에는 마음 속 깊은 곳에서 죄책감이 밀려오죠. 바쁜데 잠까지 못자니, 스트레스가 이만저만이 아닐 거예요. 당신을 섬세하게 챙겨주는 다정한 능글캐 최애를 수면 메이트로 추천할게요.\n\n  수면 전후의 습관을 잘 세우는 것만으로도, 수면의 질과 우리의 행복에 큰 영향을 미친다는 사실. 편안한 밤과 상쾌한 아침을 위한 나잇 모닝 루틴 미션 패키지를 드릴게요! 메이트 최애와의 친밀도를 높여가며 루틴을 조금씩 완수해보세요."
            
        static let shortRoutineBeforeArray = ["내일 입을 옷 꺼내두기", "물 떠놓기"]
        static let shortRoutineAfterArray = ["기상하기", "물 마시기"]
        static let longRoutineBeforeArray = ["내일 입을 옷 꺼내두기", "물 떠놓기", "방에 모든 불 끄기"]
        static let longRoutineAfterArray = ["기상하기", "커튼 열기", "물 마시기"]
        static let duringRoutineArray = ["스마트폰 없이 잠들기"]
    }
    
    
    // MARK: - ChatView
    
    enum ChatView {
        static let firstChatButtonText = "요즘 잠이 안와😵"
        static let secondChatButtonText = "알람을 잘 못 들어🧐"
        static let thirdChatButtonText = "자꾸 밤을 세네😫"
        static let fourthChatButtonText = "준비됐어!"
        
        static let startFirstLabelText = "hey 친구야 어제는 잘 잤어?"
        static let startSecondLabelText = "못 잤다구?"
        static let endFirstLabelText = "안되겠다."
        static let endSecondLabelText = "너에게 딱 맞는 루틴을 알고 있는\n수면 요정을 데려와줄게."
        static let endThirdLabelText = "네 요정 취향까지 가득 담아서!"
        static let endFourthLabelText = "머릿속에 최애를 떠올리면서\n몇가지 질문에 답해줘!"
    }
    
    // MARK: - SettingView
    
    enum SettingView {
        static let tableViewArray = ["수면 시간", "반복"]
        static let timeTableViewDictionary = [0:"8시간", 1:"9시간", 2:"10시간", 3:"11시간"]
        static let repeatTableViewArray = ["없음", "요일 반복"]
        static let repeatTableViewDictionary = [0:"월", 1:"화", 2:"수", 3:"목", 4:"금", 5:"토", 6:"일"]
        static let commaText = ", "
        static let repeatDayText = "요일"
        static let everyDayText = "매일"
        static let everyWeekdayText = "주중"
        static let everyWeekendText = "주말"
        static let initialResultArray = ["8시간", "없음"]
        static let initialRepeatText = "없음"
        static let mainButtonText = "규칙적인 수면 시작하기"
        static let navigationTitleText = "시간 설정하기"
        static let timeNavigationTitleText = "수면 시간"
        static let repeatNavigationTitleText = "반복"
    }
    
    // MARK: - PopupView
    
    enum PopupView {
        static let titleLabelText = "정확한 수면 측정을 위해\n권한을 허용해주세요."
        static let navigationTitleText = "취침 시간 설정하기"
    }
    
    // MARK: - RoutineStartView
    
    enum RoutineStartView {
        static let beforeLabelText = "수면 전"
        static let afterLabelText = "수면 후"
        static let hourText = "시간"
        static let navigationTitleText = "추천 수면 루틴"
        static let recommendTimeText = "권장 시간 : "
        static let promiseTimeText = "약속 시간 : "
        static let duringCellText = "스마트폰 없이 잠들기"
    }
}
