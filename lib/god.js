if (!this.soundCreator || !
	this.imageParser || !this.imageDatum || !
	this.imageCreator || !this.context || !this.wave) {
	throw "God file must be run last";
}
(function(exports) {
	exports.god = (function() {
		var el = exports.document.createElement('div');
		el.setAttribute('id', 'data-view');
		var img = exports.imageCreator.makeImage(
			exports.imageDatum);
		exports.imageCreator.loadImage(exports.location.hash, exports,
			function() {
				el.textContent = JSON.stringify(
					exports.soundCreator.makeSounds(
						exports.imageParser.getFreqs(
							exports.imageCreator.height,
							exports.imageCreator.width,
							img),
						exports.wave.createOscFun(exports.context, exports.osc.create)
					));
				exports.document.body.appendChild(el);

				//play
				var step = function() {
					exports.soundCreator.playSounds();
					return function() {
						exports.setTimeout(step(), 100);
					};
				};
				step()();
			});
	})();
}(this));