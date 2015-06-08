var ArticleStore = {
	article: null,
	callbacks: [],
	registerCallback: function(callback) {
		this.callbacks.push(callback);
	},
	fireCallbacks: function() {
		var that = this;
		this.callbacks.forEach(function(callback) {
			callback(that.article);
		});
	}
}