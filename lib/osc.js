this.osc = {};
(function(exports) {

	exports.path = function() {
		var path = {};
		path.vals = [];
		path.step = function() {
			if (path.vals.length === 0) {
				return false;
			}

			return path.vals = path.vals.slice(1, path.vals.length);
		};
		path.append = function(freq) {
			path.vals.push(freq);
			return this;
		};
		return path;
	};

	exports.create = function(context) {
		var osc = {};
		osc.raw = context.createOscillator();
		osc.raw.connect(context.destination);
		osc.raw.noteOn(0);

		osc.setF = function(val) {
			osc.raw.frequency.value = exports.toHumanFreq(val);
			return osc;
		};

		osc.kill = function() {
			osc.raw.disconnect();
			return osc;
		};


		osc.path = exports.path();

		return osc;
	};

	exports.toHumanFreq = function(f) {
		return f * 4985 + 15;
	};

}(this.osc));