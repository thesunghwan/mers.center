class Api::V1::UsersController < ApplicationController
  def facebook
    access_token = params[:access_token]

    if access_token.nil? || access_token.length == 0
      render :json => {
        error: Error.create(Error::INSUFFICIENT_PARAMETER, "facebook access token"),
        message: 'facebook access token이 비어있습니다.'
      } and return
    end

    facebook_user = FbGraph::User.me(access_token).fetch

    uid = facebook_user.identifier
    email = facebook_user.email

    oauth = Oauth.find_by(uid: uid, oauth_type: 'facebook')
    if oauth
      #해당 페이스북 계정으로 가입한 적이 있는 경우, 로그인 플로우 시작
      user = oauth.user
    else
      #해당 페이스북 계정으로 가입한 적이 있는 경우, 회원가입 플로우 시작
      user = User.find_by(email: email)
      if user
        #해당 이메일로 가입된 회원이 있을 경우 회원가입을 더이상 진행하지 않음.
        render json: {
          error: Error.create(Error::ALREADY_EXISTS_DATA, 'email'),
          message: '이미 가입된 이메일주소 입니다.'
        } and return
      end
      password = SecureRandom.urlsafe_base64(10, false)
      user = User.create(email: email, password: password, password_confirmation: password)
      oauth = Oauth.create(user_id: user.id, uid: uid, email: email, oauth_type: 'facebook')
    end


    if user.auth_token.nil?
      #auth_token이 비어있을 경우, 새로 만들어주기
      user.set_auth_token
    end

    render json: {
      error: Error.create(Error::NO_ERROR, nil),
      auth_token: user.auth_token,
      user: user.private_description,
      message: '회원가입이 완료되었습니다.'
    }
  end
end
