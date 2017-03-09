assert = require "assert"
{expect} = require "chai"

shortText = "Awesome title"
mediumText = "What about this text that probably spans just over two lines"
longText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas posuere odio nisi, non elementum ipsum posuere ac. Vestibulum et faucibus ante. Praesent mi eros, scelerisque non venenatis at, tempus ut purus. Morbi volutpat velit lacus, id convallis lacus vulputate id. Nullam eu ex sed purus accumsan finibus sed eget lorem. Maecenas vulputate ante non ipsum luctus cursus. Nam dapibus purus ut lorem laoreet sollicitudin. Sed ullamcorper odio sed risus viverra, in vehicula lectus malesuada. Morbi porttitor, augue vel mollis pulvinar, sem lacus fringilla dui, facilisis venenatis lacus velit vitae velit. Suspendisse dictum elit in quam feugiat, nec ornare neque tempus. Duis eget arcu risus. Sed vitae turpis sit amet sapien pharetra consequat quis a dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla laoreet quis augue ac venenatis. Aenean nec lorem sodales, finibus purus in, ornare elit. Maecenas ut feugiat tellus."

describe "TextLayer", ->

	describe "defaults", ->
		it "should set the correct defaults", ->
			text = new TextLayer
			text.html.should.equal "Add text"
			text.color.isEqual("#888").should.equal true
			text.backgroundColor.isEqual("transparent").should.equal true
			text.padding.should.eql Utils.rectZero()
			text.fontSize.should.equal 40
			text.fontWeight.should.equal 400
			text.lineHeight.should.equal 1.25
			text.fontStyle.should.equal "normal"
			text.style.fontFamily.should.equal "-apple-system, 'SF UI Text', 'Helvetica Neue'"

		it "should not set the default fontFamily default if the fontFamily property is set", ->
			text = new TextLayer
				fontFamily: "Monaco"
			text.fontFamily.should.equal "Monaco"

		it "should not set the default fontFamily default if the font property is set", ->
			text = new TextLayer
				font: "Monaco"
			text.fontFamily.should.equal "Monaco"

		it "should set the font property if the fontFamily property is set", ->
			text = new TextLayer
				fontFamily: "Monaco"
			text.font.should.equal "Monaco"

	describe "Auto-sizing", ->

		it "should auto size the layer the size of the text", ->
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
				text: shortText
			text.size.should.eql width: 312, height: 50

		it "should auto size the layer based on the Screen width", ->
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
				text: mediumText
			text.width.should.equal Screen.width
			text.height.should.equal 250

		it "should auto size the layer if the width is set explicitly", ->
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
				text: mediumText
				width: 100
			text.width.should.equal 100
			text.height.should.equal 550

		it "should not auto size the layer the size the layer if it is explictly set", ->
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
				text: mediumText
				width: 123
				height: 456
			text.size.should.eql width: 123, height: 456

		it "should not auto size the layer when changing text after explictly setting width", ->
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
			text.width = 123
			text.text = longText
			text.width.should.equal 123

		it "should not auto size the layer when changing text after explictly setting height", ->
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
			text.height = 456
			text.text = longText
			text.height.should.equal 456

		it "should auto size the layer based on it's parent", ->
			layer = new Layer width: 150
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
				text: mediumText
				parent: layer
			text.width.should.equal 150
			text.height.should.equal 550

		it "should auto size the layer when its parent is set afterwards", ->
			layer = new Layer width: 150
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
				text: mediumText
			text.parent = layer
			text.width.should.equal 150
			text.height.should.equal 550

		it "should adjust its size on when a new text is set", (done) ->
			text = new TextLayer
				fontFamily: "Courier, Liberation Mono"
			text.on "change:height", ->
				text.size.should.eql width: 400, height: 3500
				done()
			text.text = longText

	describe "Padding", ->
		it "should have no padding initially"
		it "should all padding when given a numeric value"
		it "should set horizontal padding"
		it "should set vertical padding"
		it "should set top, left, right and left padding"
		it "should keep padding 0 when not explicity set"
		it "should have a preference for more specific padding definitions"
