# 메르스 센터 mers.center

메르스 센터는 코로나 바이러스의 중동 호흡기 증후군, 메르스에 대한 정보를 제공합니다.

## 개발 환경 구축하기

`ruby 2.2.x, rails 4.2`

```
# install ruby
rvm install 2.2.0
gem install bundler

# clone this repo!
cd mers.center
git checkout develop

# 테이터 가져오기
bundle exec rake db:migrate

# 메르스가 제목에 들어가는 뉴스 가져오기
bundle exec rake crawler:run

# 메르스 환자 정보 입력하기
bundle exec rake crawler:load_patients

# 레일즈 run!
bundle install
rails s 

# open http://localhost:3000
# rock & roll!
```

## 기여하기
여러분들의 참여를 기다리고 있습니다. 바라는 점이나 불편한 점은 [이슈](https://github.com/thesunghwan/mers.center/issues)에 올리거나, 코드를 제출할 수 있습니다.

1. 일단 [포크](https://github.com/thesunghwan/mers.center/fork)합니다.
2. 피처 브랜치를 만듭니다. `git checkout -b my-new-feature`
3. 수정사항을 커밋합니다. `git commit -am 'Add some feature'`
4. 만든 피처 브랜치로 푸시합니다. `git push origin my-new-feature`
5. 반영이 필요하다고 요청(Pull Request)합니다.

## 이력

2015. 00월 시작

## 크레딧

## 라이선스
