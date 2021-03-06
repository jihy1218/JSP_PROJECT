# JSP_PROJECT

## 심심해? 들어와! 당근
![KakaoTalk_20211212_152241152_04](https://user-images.githubusercontent.com/91596526/145940316-5581bc88-5f7b-4a63-9097-8100c1549309.gif)

### 주제
> 주제
>> 심심할 시간 없는 현대인들을 위해 킬링타임 채팅 사이트!

> 주타겟층
>> 인터넷 상에서 친구를 만들고싶은 누구든

#### 개발환경
> Eclips Enterprise , JDK 1.8.0, Mysql , Apache Tomcat 9.0 , Bootstrap 4.0

#### 주요기능 개발 우선순위
> 1대1 채팅방 , 단체 채팅방<br>
> 방만들기, 랜덤입장, 방선택입장<br>
> 친구추가, 친구목록<br>
> 쪽지기능<br>
> 회원가입<br>
> 로그인<br>
> 결제<br>
> 차단<br>


#### 폰트 및 메인컬러
> 폰트 : 롯데마트드림체 ![image](https://user-images.githubusercontent.com/91596526/147302227-b08b646e-ace8-470a-a546-5b6c8a1e6425.png)<br>
> 카페24 동동  ![image](https://user-images.githubusercontent.com/91596526/145939938-f0ddec36-0da4-45a9-ae70-f6fe6bac173d.png)

>> 컬러 : #ff7915 ![image](https://user-images.githubusercontent.com/91596526/145911414-b210ee1b-a58c-4613-8b97-b6aa476c2497.png)<br>
    #3f7d1b ![image](https://user-images.githubusercontent.com/91596526/145911372-251b22ec-bfa5-458d-84f8-ea30806d2876.png)<br>
    #ffaa21 ![image](https://user-images.githubusercontent.com/91596526/145911314-7485d8b8-f435-4690-97a7-9d75e4d8f784.png)<br>
    #e3ad06 ![image](https://user-images.githubusercontent.com/91596526/145911223-8a0cf0d9-d2af-4f09-9412-db09286fbbdc.png)



#### 개발일정
> [12/10~12/31 약22일(3주)]

#### 세부일정[개인별 체크리스트]
|날짜|내용|
|---|---|
|2021.12.10|주제선정<br>1차회의(주제선정,ReadME작성,협업규칙)|
|2021.12.11~2021.12.12|회의(프론트 구조도 구성)<br> 메인페이지 사이즈, 메인 폰트/사이즈, 메인 색상 등등 |
|2021.12.13|DB설계(DB초안설계)<br> ER다이어그램(컨트롤러 구조도)|
|2021.12.14|컨트롤러설계|
|2021.12.15~2021.12.17|프론트 구현|
|2021.12.18~2021.12.19|프론트구현(페이지전환완료)|
|2021.12.20|프론트구현 테스트|
|2021.12.21~2021.12.27|Controller,Dao,Dto작성|
|2021.12.28~2021.12.29|프로젝트 병합 및 디버깅|
|2021.12.30|프로젝트 테스트|
|2021.12.31|프로젝트발표|

#### 역할 분담
> 프론트 구현
>> 오동진 : 친구관련 JSP 프론트 구현 게시판 검색 페이징처리, 정렬 JSP Controller, Dao 등등 작성<br>
>> 이예지 : 쪽지관련 JSP 프론트 구현, 댓글CRD, 게시판CRUD, JSP,Controller,Dao 등등 작성<br>
>> 이민욱 : 로그인 회원가입 JSP 프론트 구현, 채팅(WebSocket)방만들기,방선택입장,1대1채팅방 JSP ,Controller,JS 등등 작성<br>
>> 김지형 : 메인 채팅 JSP 프론트 구현, 결제, 채팅(WebSocket)빠른입장,방검색 JSP,Controller,JS 등등 작성

#### 팀 프로젝트 협업 규칙[폴더명/파일명 규칙,코드규칙,코드공유방식,주석]
> 폴더명 : 소문자
> 파일명 : jsp- 소문자<br> js- 소문자 <br> css-소문자 <br> java-맨앞글자 대문자 and 단어가 바뀌면 대문자 ex)ProductDao.java
> 코드규칙 : 변수명 : 소문자 <br> 단어바뀌면 _ ex)m_no <br> 메소드명 : 소문자 ex)signup() <br> 

#### 컨트롤러 구조도 
![image](https://user-images.githubusercontent.com/91596526/145777219-3022d0aa-7f87-493f-a9fe-5ffde01d0a47.png)

#### DB 구조도
![image](https://user-images.githubusercontent.com/91596526/145779999-38c0a3cd-74a5-4a0b-9709-2f8781834182.png)
