var Home = React.createClass({
  getInitialState: function() {
    return {
      featured_news: this.props.featured_news,
      government_news: this.props.government_news
    }
  },  
  render: function() {
    return (
      <div id='Home'>
        <Home.FeaturedNews articles={this.state.featured_news} />
        <Home.GovernmentNews articles={this.state.government_news} />
        <Home.OtherReferences />
      </div>
    );
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
      <div id='FeaturedNews' className='home-news'>
        <div className='news-container'>
          <div className='title-container'>
            <h3 className='title'>주요 뉴스</h3>
            <a className='more' href='/news/featured'>더보기</a>
          </div>
          <div className=''>
            {articleRows}
          </div>
        </div>
      </div>
    )
  }
});

Home.GovernmentNews = React.createClass({
  render: function() {
    var articleRows = this.props.articles.map(function(article) {
      return (
        <Home.ArticleRow key={article.uid} article={article} />
      )
    })
    return (
      <div id='GovernmentNews' className='home-news'>
        <div className='news-container'>
          <div className='title-container'>
            <h3 className='title'>정부 소식</h3>
            <a className='more' href='/news/government'>더보기</a>
          </div>
          <div className=''>
            {articleRows}
          </div>
        </div>
      </div>
    )
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