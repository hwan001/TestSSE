# Java Spring Framework (Legacy) Project Template

Spring MVC 구성을 **Spring Boot 없이** 만든 메이븐 빌드 기반의 Dynamic Web Project

## 환경 구성
- **Java**: JDK 11  
- **Tomcat**: Tomcat 9.0
- **Maven (WAR packaging)**
- **Docker** : 현재 구성에서 필수는 아니지만 있으면 편함

## Spring Framework 레포지토리 구성한 순서

1. **Install Java EE & Web Developer Tools**
   - 이클립스(STS) 경우 마켓플레이스에서 아래 있는거 설치해야 Dynamic Web Project 생성이 가능함
     - `Eclipse Enterprise Java and Web Developer Tools <version>`

2. **Create a Dynamic Web Project**
   - Dynamic Web Project 생성하기 -> `File > New > Project > Web > Dynamic Web Project`

3. **Convert to a Maven Project**
   - 프로젝트 우클릭 후 `Configure > Convert to Maven Project` 선택


## 사용 방법

1. 현재 레포지토리를 템플릿으로 설정해 새로운 Spring Framework 프로젝트용 레포지토리 만들기
2. 새로 생성한 레포지토리를 내려받아(clone) IDE로 프로젝트 열기
3. 코드 작성 후 메이븐 빌드하고 톰캣에 올려서 결과보기
   - 직접 배포 시 (톰캣 설치 필요)
      - **STS (Eclipse)** : Server로 추가해서 기존처럼 사용 
      - **VSCode, IntelliJ** : mvn 빌드 후 생성된 WAR 파일을 톰캣 webapp 경로에 이동시키고 톰캣 재시작
   - 도커 활용 시 (도커 설치 필요)
      - **VSCode, STS (Eclipse)** : pom.xml, docker-compose.yml 있는 경로(프로젝트 루트)에서 아래 명령 실행
         ```sh
            mvn clean package # target 에 war 생성
            docker compose -f docker-compose.dev.yml up --build --force-recreate # 톰캣에 위에 빌드한 war 파일 넣고 실행
         ```
      - **IntelliJ** : VSCode와 동일한 방식이지만 Run > EditConfiguration 으로 등록해서 단축키 지정 가능
         - Settings > Plugin 에서 Docker Plugin 설치 필요