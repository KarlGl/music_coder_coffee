// (function(exports) {
// 		var el = exports.document.createElement('div');
// 		el.setAttribute('id', 'data-view');
// 			el.textContent = JSON.stringify(
// 				exports.soundCreator.makeSounds(
// 					exports.imageParser.getFreqs(
// 						exports.imageCreator.height,
// 						exports.imageCreator.width,
// 						img),
// 					exports.wave.createOscFun(exports.context, exports.osc.create)
// 				));
// 			exports.document.body.appendChild(el);

// 			//play
// 			var step = function() {
// 				exports.soundCreator.playSounds();
// 				return function() {
// 					exports.setTimeout(step(), 100);
// 				};
// 			};
// 			step()();
// 		});
// })();
// }(this));