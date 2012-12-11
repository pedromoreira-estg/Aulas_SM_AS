package {
	import flash.display.MovieClip;
	import flash.net.SharedObject;
	import flash.events.*;
	import flash.utils.*;
	import registo;
	
	public class JogoPontos extends MovieClip {
		
		var local:SharedObject;
		
		var cxNome:CxNome = new CxNome();
		var bAgain : Again = new Again();
		
		private const numPontos:Number = 10;
		private const numClicks:uint = 10;
		var clicks:uint;
		var ti;
		var tf;
		var pontuacao;
		var reg;
		
		
		public function JogoPontos () {
			stage.addEventListener("gameover",onGameOver);
			joga();
		}
		
		function joga() {
			clicks = 0;
			stage.addEventListener(MouseEvent.CLICK, onClick);
			ti = getTimer();
		}
		
		
		function onClick(e:Event) {
			trace("ola");
			clicks++;
			if (clicks == numClicks) {
				dispatchEvent(new Event("gameover",true));
			}
		}
		
		function onGameOver(e:Event) {
			tf = getTimer();
			pontuacao = tf-ti;
			insereNome();
			iniciaSO();
			//fazPontos();
			stage.removeEventListener(MouseEvent.CLICK, onClick);
			
		}
		
		function insereNome() {
			cxNome.x = 300;
			cxNome.y = 200;
			cxNome.oPontos.text = pontuacao.toString();
			addChild(cxNome);
			cxNome.ok.addEventListener(MouseEvent.CLICK,onNome);
		}
		
		function onNome(e:MouseEvent) {
			cxNome.ok.removeEventListener(MouseEvent.CLICK,onNome);
			reg = new registo(cxNome.iNome.text,pontuacao);
			local.data.pontos.push(reg);
			local.data.pontos.sortOn("resultado", Array.NUMERIC);
			local.data.pontos.pop();
			local.flush();
			removeChild(cxNome);
			cxNome.iNome.text = "";
			fazPontos();
		}
		
		function fazPontos() {
			for(var i=0;i<numPontos;i++) {
				var pd:PontoDisplay = new PontoDisplay();
				pd.x = 275;
				pd.y = 20 + i * 25;
				trace("n", local.data.pontos[i].nome);
				pd.tOrdem.text 	= i.toString();
				pd.tNome.text = local.data.pontos[i].nome.toString();
				pd.tPontos.text = local.data.pontos[i].resultado.toString();
				addChild(pd);
				}
			bAgain.x = 275;
			bAgain.y = 300;
			addChild(bAgain);
			bAgain.addEventListener(MouseEvent.CLICK, onPlayAgain);
		}
			

		function iniciaSO() {
			local = SharedObject.getLocal("pontos")
			if (local.data.pontos == undefined ) {
				local.data.pontos = new Array();
				for(var i=0;i<numPontos;i++) {
					var p = new registo('anonymous',100000);
					trace(p.nome);
					trace(p.resultado)
					local.data.pontos.push(p);
					}
				local.flush();
				}
			else {
				//se for preciso limpar e inicializar
				//local.clear();
				}
			}
			
		function onPlayAgain(e:MouseEvent) {
			bAgain.removeEventListener(MouseEvent.CLICK, onPlayAgain);
			while(numChildren) {
				removeChildAt(0);
			}
			e.stopPropagation();
			joga();
		}

	}
}