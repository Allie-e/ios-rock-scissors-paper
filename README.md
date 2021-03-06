## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소
---

# 묵찌빠게임
---
컴퓨터가 제시하는 임의의 숫자와 사용자가 입력하는 숫자를 비교하여 가위바위보 게임을 진행.

## 페어 프로그래밍 규칙
- 순서도는 먼저 그리고 시작한다.
- 서로 번갈아 가며 하나의 함수를 구현한다.

## Step 1

- 실행 예
> 가위(1), 바위(2), 보(3)! <종료 : 0> : 1
>
> 비겼습니다!
> 
> 가위(1), 바위(2), 보(3)! <종료 : 0> : 6
> 
> 잘못된 입력입니다. 다시 시도해주세요.
> 
> 가위(1), 바위(2), 보(3)! <종료 : 0> : 3
> 
> 이겼습니다!
> 
> 게임 종료

## Flowchart
![](https://i.imgur.com/QzGX1P8.jpg)

---
## 1. 함수들의 기능 설명
- `runGame()`
    - 게임을 시작하고 사용자의 입력 값을 받아 각 케이스 별로 게임을 진행하는 함수
        - 입력 값이 `0`일때, 게임종료
        - 입력 값이 `1~3`일때, 게임진행
        - 입력 값이 `0~3` 이외인 경우, 잘못된 입력 출력 후 다시 runGame 함수 호출

- `recieveUserInput()`
    - 사용자 입력을 받아 `String? type`의 값을 `Int type`으로 변환 해주는 함수

- `compareNumbers(computerNumber: Int, userInputnumber: Int)`
    - 컴퓨터의 랜덤 숫자와 사용자 입력 숫자를 비교하여 게임 승패와, 비긴 결과를 판정하는 함수


---
## 2. Key Experience
### 이슈 및 해결방법
1. 게임 진행 시 이기고, 지는 경우를 어떤 조건으로 나눠서 표현할 지 고민
    - 가위, 바위, 보 각각 숫자를 할당하여 컴퓨터 랜덤값과 사용자 입력값의 차이를 통해 비교 
2. `readLine()` 을 통해 옵셔널 `String`으로 받은 입력값을 `Int`로 변환하는 과정에서 `if let`을 중첩하여 사용 
    - 함수에 각각 `String`, `Int`변수를 생성하여 해결 
3. `runGame()`함수에서 `recieveUserInput()`를 바로 받아와서 `switch` 문을 작성할 경우 오류가 생기는 문제 
    - `runGame()`에서 직접 입력 값을 받고, 이를 `recieveUserInput()`에서 parameter로 받아서 해결

---
## Step 2

- 실행 예
> 가위(1), 바위(2), 보(3)! <종료 : 0> : 1
> 
> 이겼습니다!
> 
> [사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 6
> 
> 잘못된 입력입니다. 다시 시도해주세요.
> 
> [컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 3
> 
> 컴퓨터의 턴입니다
> 
> [컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 3
> 
> 사용자의 턴입니다
> 
> [사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 3
> 
> 사용자의 승리!
> 
> 게임 종료

## Flowchart
![](https://i.imgur.com/JQf0Pvp.jpg)

## 1. 함수들의 기능 설명
- `runRockScissorsPaper()` 
    - 게임을 시작하고 사용자의 입력 값을 받아 각 케이스 별로 게임을 진행하는 함수
        - 입력 값이 0일때, 게임종료
        - 입력 값이 1~3일때, 결과에 따라 묵찌빠 게임으로 이어서 진행
        - 입력 값이 0~3 이외인 경우, 잘못된 입력 출력 후 다시 `runRockScissorsPaper()` 함수 호출
        
- `convertUserInputType()`
    - 사용자 입력을 받아 `String? type`의 값을 `Int type`으로 변환 해주는 함수

- `compareRockScissorsPaper()`
    - 컴퓨터의 랜덤 숫자와 사용자 입력 숫자를 비교하여 가위바위보 게임 승패와, 비긴 결과를 판정하는 함수
- `switchTurn()`
    - 묵찌빠 게임 진행시 사용자와 컴퓨터의 턴을 바꿔주는 함수
- `runMukJjiBba()`
    - 묵찌빠 게임을 시작하고 사용자의 입력 값을 받아 케이스 별로 게임을 진행하는 함수
- `compareMukJjiBba()`
    - 컴퓨터의 랜덤 숫자와 사용자 입력 숫자를 비교하여 묵찌빠 게임 결과를 판정하는 함수

## 2. Key Experience
### 이슈 및 해결 방법
1. `convertUserInputType()` 함수에서 오류를 처리하면서 `runRockScissorsPaper()`, `runMukJjiBba()`에서 오류 처리 구문을 사용해줘야 함. 
    - do-try-catch 문을 사용하여 오류 처리를 해줬고 입력값으로 `convertUserInputType()`를 넣어주는 `compareRockScissorsPaper()`, `compareMukJjiBba()`에 try문을 적어줌.
2. 가위바위보와 묵찌빠에 할당된 숫자가 바뀌면서 비슷한 로직의 함수를 다시 작성해야 하는 문제. 
    - 현재 `compareRockScissorsPaper()`, `compareMukJjiBba()`의 로직을 서로 다르게 구현. 

## 참고 문서
- [Swift Language Guide - Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Apple Developer Document - Error](https://developer.apple.com/documentation/swift/error)
