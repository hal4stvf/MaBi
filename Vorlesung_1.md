# Mathematische Bildverarbeitung 
Marko Lindner

** Organisatorisches ** 

Mo 11:30 A1.15 
Do 15:45 A0.13 

## 1. Überblick

### Beispiele
\%
1. Medizinische Anwendung
2. Impainting 

%\

Technik der Bildverarbeitung:	
- Kontrastverbesserung
- Entrauschen
- Kantendetektion
- Schärfen 
- Inpainting
- Segementierung (einzelne Objekte detektieren)
- Regristierung (Bilder desselben Objektes in Einklang bringen)

Unser Fokus:
- mathematische Beschreibung

Verwandte Vorlesungen:
- 3D computer vision (WiSe) Prof. Grigat
- Digitale Bildanalyse (WiSe)	Prof. Grigat 
- Mustererkennung & Datenkompression (SoSe)	Prof. Grigat 
- Medical Imaging	(Prof. Schläfer, Knopp)

### Literatur:
[siehe studip](https://e-learning.tu-harburg.de/studip/dispatch.php/course/literature?cid=7271d790b8fcdf021ee895ef9d4a4ccb&view=literatur_sem)  

## 2. Was ist ein Bild ?
1. digitale/diskrete Sicht: siehe Bild (Matrix)
		Werkzeuge: Lineare Algebra
		Vorteile: endlicher Spektralsatz
		Nachteile: Probleme z.B.
			- beim Zoomen
			- bei Rotationen, etc.
2. kontinuierliche/analoge Sicht: siehe Bild (Funktionen in 2 Veränderlichen)
		Werkzeuge: Analysis
		Vorteile: mehr Freiheiten (z.B. Kanten = Linien, entlang, der die Fkt. unstetig ist.)
			- differenzieren, integrieren
		Nachteile: unendlicher Speicherplatz

### Definition
Ein *Bild* ist eine Funktion $u: \Omega \to F$, wobei 
$\Omega \subset \mathbb{Z}^d$ (diskret) oder $\Omega \subset \mathbb{R}^d$ (kontinuerlich) 	
- $d = 2$ (typisches 2D Bild)
- $d = 3$ (3D-Bild bzw. "Körper" *oder* 2D im Ort + Zeit)

$F$ ... *Farbraum*
- $F = [0,1]$ oder ${0,1,...,255}$ (Graustufen) 
- $F = {0,1}$ (schwarz/weiß)
- $F = [0,1]^3$ $(R\; G\; B)$ oder ${0,1,...,255}^3$ (Farbbilder)

Häufig, $\Omega \subset \mathbb{R}^2$, 

z.B. $\Omega = [a,b] \times [c,d] $

$F = [0,1]$

**Umwandlung:** diskrete $\leftrightarrow$ kontinuierliche Bilder
1. kontinuierlich $\rightarrow$ diskret:
	- $\Omega$ im Gitter zerlegen
	- jede Box durch nur noch einen Farbwert repäsentieren
		- Funktionswert im Mittelpunkt des Box
		- Mittelwert $\frac{1}{|B_i|} \int_{B_i} u(x) dx$ von $u$ auf der Box $B_i$
2. diskret $\rightarrow$ kontinuierlich:
	1. Idee: Jeder Punkt in Box $B_i$ erhält den Funktionswert von $B_i$ (als diskretes Pixel)
		$\Rightarrow$ "nearest neighbour interpolation" 
	2. Idee: Mittelpunkt von Box $B_i$ erhält den Wert von Pixel $B_i$
		- Grenzwert $p:=$ gewichtetes Mittel aus Grenzwerten $a,b,c,d$
			
		$= (1-\alpha)(1-\beta) a + \alpha(1-\beta) b + (1-\alpha)\beta c + \alpha \beta d$
