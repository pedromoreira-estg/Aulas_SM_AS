﻿package  {		import flash.display.MovieClip;	import flash.events.KeyboardEvent;	import flash.events.Event;	import flash.ui.Keyboard;	import flashx.textLayout.elements.InlineGraphicElement;		public class teclas1 extends MovieClip {				const DX : int = 15;		const DY : int = 15;				var UP 		: Boolean = false;		var DOWN 	: Boolean = false;		var RIGHT : Boolean = false;		var LEFT	: Boolean = false;				var pulga : Pulga;				public function teclas1() {			// constructor code			init();			stage.addEventListener(KeyboardEvent.KEY_DOWN, onkeydown);			stage.addEventListener(KeyboardEvent.KEY_UP, onkeyup);			addEventListener(Event.ENTER_FRAME,updateFPS);		}						function init() {			pulga = new Pulga();			pulga.x = stage.stageWidth / 2;			pulga.y = stage.stageHeight / 2;			addChild(pulga);		}				function updateFPS(e:Event) {			update();		}				function update() {			if (UP) pulga.y -= DY;			else if (DOWN) pulga.y += DY;			if (RIGHT) pulga.x += DX;			else if (LEFT) pulga.x -= DX;		}				function onkeydown(e:KeyboardEvent) {			if (e.keyCode == Keyboard.DOWN) {				DOWN = true;			} else if (e.keyCode == Keyboard.UP){				UP = true;			} else if (e.keyCode == Keyboard.LEFT){				LEFT = true;			} else if (e.keyCode == Keyboard.RIGHT){				RIGHT = true;			}						// update em cada key down			// update();			// e.updateAfterEvent();		}				function onkeyup(e:KeyboardEvent) {			if (e.keyCode == Keyboard.DOWN) {				DOWN = false;			} else if (e.keyCode == Keyboard.UP){				UP = false;			} else if (e.keyCode == Keyboard.LEFT){				LEFT = false;			} else if (e.keyCode == Keyboard.RIGHT){				RIGHT = false;			}		}	}	}