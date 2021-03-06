//
//  RockPaperScissors - main.swift
//  Created by Coda & Tak
//  Copyright © yagom academy. All rights reserved.
//
import Foundation


enum GameDecision {
    case start
    case restart
    case exit
}

enum GameResult {
    case win
    case draw
    case lose
    case error
}

/** ## 가위바위보에 대한 기능(속성)과 메서드(행동)을 'RockPaperScissors 타입'으로 묶었음.
----------
- Computer의 임의의 수와 User에게 입력받은 값을 배열로 묶어 표현함.
- 컴퓨터의 수에서 사용자의 수를 빼서 나올수 있는 경우의 수를 묶어 결과값을 산출하였음
- 승리할 시 (-1,2) / 패배할 시 (-2,1) / 비겼을 시 (0) */
class RockPaperScissorsGame {
    var inputNumber: Int = 0
    var randomNumber: Int = 0
    var DecisionAboutGamePlay: GameDecision = GameDecision.restart
    var gameCommand: GameResult = GameResult.draw
    var decisionNumber: Int = 0
    
    ///컴퓨터에서 가위바위보 중 무엇을 낼지를 결정하는 단계
    func setRandomNumber() {
        randomNumber = Int.random(in: 1...3)
    }

    /// 입력값을 받아 Bool 타입으로 반환.
    /// 입력값은 class 내부의 변수로 저장.
    func isValidInputNumber() -> Bool {
        guard let temporaryValue: String = readLine(),
              let deliveryNumber: Int = Int(temporaryValue)
        else { return false }
        inputNumber = deliveryNumber
        return true
    }
    
    /// checkInputNumber의 Bool값을 통해 예외 사항(nil 혹은 문자열을 입력했을 시)을 처리하고
    /// inputNumber에 저장된 숫자를 바탕으로 게임진행여부 결정
    func decideGamePlaying() {
        if isValidInputNumber() == true {
            switch inputNumber {
            case 0:
                DecisionAboutGamePlay = GameDecision.exit
            case 1, 2, 3:
                DecisionAboutGamePlay = GameDecision.start
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
                DecisionAboutGamePlay = GameDecision.restart
            }
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            DecisionAboutGamePlay = GameDecision.restart
        }
    }
    
    func linkExitAndError() {
        if DecisionAboutGamePlay == GameDecision.exit {
            gameCommand = GameResult.error
        }
    }


    func subtractNumbers(from: Int, by: Int) {
        decisionNumber = from - by
    }
    
    /**
    ### 컴퓨터의 수에서 사용자 입력값을 뺀 값에 따라 각각의 case 분류
    - ex) 컴퓨터의 수: 1(가위) - 사용자입력값: 2(바위) = -1로 사용자승리.
    ------
    - case에 따라 win, lose, draw 값을 gameCommand에 저장.*/
    func sortResult(by: Int) {
            switch (by) {
            case -1, 2:
                gameCommand = GameResult.win
            case 1, -2:
                gameCommand = GameResult.lose
            case 0:
                gameCommand = GameResult.draw
            default:
                return
        }
    }
    
    func checkAndSort() {
        if DecisionAboutGamePlay == GameDecision.start {
            sortResult(by: decisionNumber)
        }
    }
        
    ///결과값 출력
    func printResult() {
        switch gameCommand {
        case GameResult.win:
            print("이겼습니다.")
        case GameResult.lose:
            print("졌습니다.")
        case GameResult.draw:
            if DecisionAboutGamePlay == GameDecision.start {
            print("비겼습니다.")
            }
        default:
            return
        }
    }
    
    /// 컴퓨터, 사용자 가위바위보 초기화
    func initializeNumbers() {
        inputNumber = 0
        randomNumber = 0
    }
    
    ///## 게임을 시작하는 메서드
    ///---------
    ///- 컴퓨터와 사용자가 서로 비겼거나, 게임 진행 여부가 restart일때 반복.
    ///- 처음에 while문 내부로 진입하기 위해. gameCommand의 값을 draw로, GameDecision의 값을 restart로 설정해두었음.
    func start() {
        while gameCommand == GameResult.draw || DecisionAboutGamePlay == GameDecision.restart {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            setRandomNumber()
            decideGamePlaying()
            linkExitAndError()
            subtractNumbers(from: randomNumber, by: inputNumber)
            checkAndSort()
            printResult()
            initializeNumbers()
        }
    }
}


let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.start()


/*
enum 묵찌빠결과 {
    case 컴퓨터턴
    case 사용자턴
}

class 묵찌빠 : RockPaperScissorsGame{
    func 턴정하기() {
        switch gameCommand {
        case GameResult.win:
            print("a") // 사용자턴
        case GameResult.lose:
            print("b") // 컴퓨터턴
        default:
            return
        }
    }
    
    func printTurn() {
        print("[aaa턴] 묵(1), 찌(2), 빠(3)! <종료:0>: ", terminator: "")
    }
/* sortResult(a: Int, b: Int, c: gameDecision){
     
*/
}
    
*/
