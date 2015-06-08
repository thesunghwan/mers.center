var Articles = React.createClass({
	getInitalState: function() {
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

		ArticleStore.article = this.props.article;
		ArticleStore.fireCallbacks();
	},
	renderDate: function() {
		if(this.state == null) {
			return <span />
		} else {
			return <div className='date'><span className='posted-date'>{this.state.rearrangedTime}</span>, <span className='from-now'>{this.state.fromNow}</span></div>
		}
	},
	render: function() {
		return (
			<div id="Articles">
				<div className='title'>[{this.props.article.publisher}] {this.props.article.title}</div>
				{this.renderDate()}
				<div className='description' dangerouslySetInnerHTML={{__html: this.props.article.description}} />
				<a href={this.props.article.original_link}><div className='original-link'>원문보기</div></a>
			</div>
		)
	}
});