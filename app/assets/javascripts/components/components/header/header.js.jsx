var Header = React.createClass({
  render: function() {
    return (
      <div id='Header'>
        <div className='header-container'>
          <a href='/'>
            <img className='BI' src='/assets/logo_mers.png' />
          </a>
          <Header.Right />
        </div>
      </div>
    );
  }
});

Header.RightNewsViewer = React.createClass({
  render: function() {
    if(this.props.article != null) {
        if(this.props.article.prev != null) {
          var prev_link = "/articles/" + this.props.article.prev.uid;  
        } else {
          var prev_link = null;
        }

        if(this.props.article.next != null) {
          var next_link = "/articles/" + this.props.article.next.uid;
        } else {
          var next_link = null;
        }
      } else {
        var prev_link = null,
            next_link = null;
      }

      if(prev_link == null) {
        var prev_tab = <span />
      } else {
        var prev_tab = <a href={prev_link}><div className='right-tab'>이전</div></a>
      }

      if(next_link == null) {
        var next_tab = <span />
      } else {
        var next_tab = <a href={next_link}><div className='right-tab'>다음</div></a>
      }
      
      var rightTab = (
        <div className='right-tabs'>
          <a href='/'><div className='right-tab'>목록</div></a>
          {prev_tab}
          {next_tab}
        </div>
      )
    return rightTab
  }
});

Header.Right = React.createClass({
  getInitialState: function() {
    return {
      article: null
    }
  },
  componentDidMount: function() {
    ArticleStore.registerCallback(this._headerRightCallback)
  },
  _headerRightCallback: function(article) {
    this.setState({
      article: article
    })
  },
  clickFacebook: function() {
    var that = this;
      FB.login(function(response) {
          $.ajax({
              type: 'POST',
              url: '/api/v1/users/facebook',
              data: {
                  access_token: response.authResponse.accessToken
              },
              success: function(res) {
                if(res.error.code == 0) {

                } else {
                  alert(res.message);
                }
              }
          })
      }, {scope: 'public_profile,email'});
  },
  render: function() {
    var pathname = window.location.pathname;
    if(pathname.split("/")[1] == "articles") {
      var rightTab = <Header.RightNewsViewer article={this.state.article} />
    } else if(pathname.split("/")[1] == "rumors") {
      var rightTab = (
        <div className='right-tabs'>
          <button className='facebook-signup'>페이스북으로 회원가입</button>
        </div>
      )
    } else {
      var rightTab = <span />
    }

    return rightTab
  }
})