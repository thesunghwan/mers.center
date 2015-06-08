var Home = React.createClass({
  getInitialState: function() {
    return {
      articles: this.props.articles 
    }
  },  
  render: function() {
    return (
      <div id='Home'>
        <Home.FeaturedNews articles={this.state.articles} />
        <Home.OtherReferences />
      </div>
    );
  }
});

Home.OtherReferences = React.createClass({
  render: function() {
    return (
      <div id='OtherReferences'>
        <h3>다른 유용한 사이트</h3>
        <Home.MersMap />
      </div>
    )
  }
});

Home.MersMap = React.createClass({
  render: function() {
    return (
      <div id="MersMap">
        <div className='map-container'>
          <a href='http://mersmap.com/'><img src='/assets/mers_map.png' /></a>
          <div className='source'>with <a href='http://likelion.net'>멋쟁이사자처럼</a> / <a href='http://www.datasquare.co.kr/'>Datasquare</a></div>
        </div>
      </div>
    )
  }
});

Home.FeaturedNews = React.createClass({
  render: function() {
    var articleRows = this.props.articles.map(function(article) {
      return (
        <Home.ArticleRow key={article.uid} article={article} />
      )
    })

    return (
      <div id='FeaturedNews'>
        <div className='title-container'>
          <h3 className='title'>주요 뉴스</h3>
          <a className='all-news' href='/news'>모든 뉴스 보기</a>
        </div>
        <div className=''>
          {articleRows}
        </div>
      </div>
    )
  }
});

Home.ArticleRow = React.createClass({
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
  render: function() {
    var link = "/articles/" + this.props.article.uid
    return (
      <a href={link}><div className='article-row row'>
        <div className='row'><span className='title'>{this.props.article.title}</span><span className='publisher'>[{this.props.article.publisher}]</span></div>
        <div className='row'><span className='posted-date'>{this.state.rearrangedTime}</span>, <span className='from-now'>{this.state.fromNow}</span></div>
      </div></a>
    )
  }
});