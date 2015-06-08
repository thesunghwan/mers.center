var NewsTabs = React.createClass({
	getInitialState: function() {
		return {
			newsClass: "tab",
			featuredNewsClass: "tab",
			governmentNewsClass: "tab"
		}
	},
	componentDidMount: function() {
		var pathname = window.location.pathname;

		if(pathname == "/news") {
			this.setState({
				newsClass: "tab active"
			});
		} else if(pathname == "/news/featured") {
			this.setState({
				featuredNewsClass: "tab active"
			});
		} else if(pathname == "/news/government") {
			this.setState({
				governmentNewsClass: "tab active"
			});
		}
	},
	render: function() {
		return (
			<div id='NewsTabs'>
				<a href='/news'><div className={this.state.newsClass}>모든 뉴스</div></a>
				<a href='/news/featured'><div className={this.state.featuredNewsClass}>주요 뉴스</div></a>
				<a href='/news/government'><div className={this.state.governmentNewsClass}>정부 소식</div></a>
			</div>
		)
	}
});