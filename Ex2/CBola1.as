﻿package  {		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;			public class CBola1 extends MovieClip {				var ping = new CPing();		var deltax = Math.random() * 10 - 5;		var deltay = Math.random() * 10 - 5;		var scale = Math.random() * 0.75 + 0.25;				public function CBola1() {			this.addEventListener(MouseEvent.CLICK,mataCBola);			scaleX = scaleY = scale;		}				private function mataCBola(e:MouseEvent) {						var eventoMata = new Event("BOLAMORTA");			parent.dispatchEvent(eventoMata);						ping.play();			this.parent.removeChild(this);			this.removeEventListener(MouseEvent.CLICK,mataCBola);		}				public function mexeCBola() {			x += deltax;			y += deltay;						if (x < 0) {				//ping.play();				deltax *= -1;				x = 0;			}			if (x > stage.stageWidth) {				//ping.play();				deltax *= -1;				x = stage.stageWidth;			}			if (y < 0) {				//ping.play();				deltay *= -1;				y = 0;			}			if (y > stage.stageHeight) {				//ping.play();				deltay *= -1;				y = stage.stageHeight;			}					}	}	}