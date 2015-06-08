var MainTabs = React.createClass({
	clickRumors: function() {
		alert('개발중입니다. 조금만 기다려주세요!');
	},
	render: function() {
		var pathname = window.location.pathname;
		if(pathname.split("/")[1] == "") {
			var newsTabClass = "new tab";
			var rumorsTabClass = "rumors tab"
		} else if(pathname.split("/")[1] == "news") {
			var newsTabClass = "new tab active";
			var rumorsTabClass = "rumors tab";
		} else if(pathname.split("/")[1] == "articles") {
			var newsTabClass = "new tab active";
			var rumorsTabClass = "rumors tab";
		} else if(pathname.split("/")[1] == "rumors") {
			var newsTabClass = "new tab";
			var rumorsTabClass = "rumors tab active"
		} else {
			var newsTabClass = "new tab";
			var rumorsTabClass = "rumors tab"
		}

		return (
			<div id='MainTabs'>
				<a href='/news'><div className={newsTabClass}>뉴스<div className='underline' /></div></a>
				<div className={rumorsTabClass} onClick={this.clickRumors}>유언비어<div className='underline' /></div>
			</div>
		)
	}
});