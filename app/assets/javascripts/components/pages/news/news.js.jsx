var News = React.createClass({
  getInitialState: function() {
    return {
      articles: this.props.articles 
    }
  },
  componentDidMount: function() {
    var that = this;
    $(window).scroll(function(e) {
      var height = $(document).height() - $(window).height(),
          scrollTop = $(window).scrollTop();
      
      var ratio = scrollTop / height;

      if(ratio > 0.80) {
        $.ajax({
          url: "/api/v1/articles",
          type: "GET",
          data: {
            last_article_uid: that.state.articles[that.state.articles.length-1].uid
          },
          success: function(resp) {
            that.setState({
              articles: that.state.articles.concat(resp.articles)
            });
          }
        });
      }
    });
  },
  render: function() {
    return (
      <div id='News'>
        <News.AllNews articles={this.state.articles} />
      </div>
    );
  }
});

News.AllNews = React.createClass({
  render: function() {
    var articleRows = this.props.articles.map(function(article) {
      return (
        <News.ArticleRow key={article.uid} article={article} />
      )
    });

    return (
      <div id='AllNews'>
        {articleRows}
      </div>
    )
  }
});

News.ArticleRow = React.createClass({
  getInitialState: function() {
    return {
      rearrangedTime: null,
      fromNow: null
    }
  },
  componentDidMount: function() {
    var rearrangedTime = moment(this.props.article.posted_date, "YYYY-MM-DDThh-mm-ss").format('YYYY.MM.DD hh:mm'),
        fromNow = moment(this.props.article.posted_date, "YYYY-MM-DDThh-mm-ss").fromNow();
    
    this.setState({
      rearrangedTime: rearrangedTime,
      fromNow: fromNow
    })
  },
  clickToMain: function(e) {
    e.preventDefault();
    var that = this;
    $.ajax({
      type: "POST",
      url: "/api/v1/articles/curation",
      data: {
        article_uid: that.props.article.uid
      },
      success: function(resp) {
        if(resp.error.code == 0) {
          alert("주요 뉴스로 이동 되었습니다.");
        } else {
          alert("서버에 문제가 생겼습니다.\nthesunghwan@gmail.com로 문의 바랍니다.");
        }
      }
    });
  },
  render: function() {
    var link = "/articles/" + this.props.article.uid
    return (
      <a href={link}><div className='article-row row'>
        <div className='row'><span className='title'>{this.props.article.title}</span></div>
        <div className='row'><span className='posted-date'>{this.state.rearrangedTime}</span>, <span className='from-now'>{this.state.fromNow}</span></div>
        <button className='to-main' onClick={this.clickToMain}>주요 뉴스로</button>
      </div></a>
    )
  }
});