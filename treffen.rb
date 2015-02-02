#Froggerspiel
Shoes.app width: 800, height: 480 do                            #groeße der Speilfeldflaeche

  image "Frogger_Hintergrund_Gimp-2.png",width: 800, height: 480    #Bild als Spielfeldflaeche

  #Funktion:  Baumstaemme bewegen sich unterschiedlich hin und her
  def baumstamm(x,y)                                            #Funktion fuer Baumstamm mit uebergabeparameter x,y, um spaeter nur noch die Startpunk x,y der einzelnen Baumstaemme angeben zu muessen.

    speed = 1                                                 #Variable die spaeter hilft, dass der Baumstamm  sich immer um 1 Pixel weiter bewegt
    direction = 1                                               #Initialisierungswert - Ich bestimme die Anfangsrichtung

    baum = image "Baumstamm.jpg",width:200,height:30            #Variable fuer das Bild Baumstamm mit Groeßenangaben
    zufallszahl = rand(5)                                       #Variabel Zufallszahl bis zur Ziffer 5
    timer(zufallszahl) do        #Iterator oder Block??         #Block der sagt,dass meine Staemme sich hin und her bewegen mit zufaellige Anfangszeit
    animate (60) do |i|                                         #Block der die Geschwindigkeit der Bewegung angiebt
        if x > 600                                              #Beginn Fallentscheidung: abprallen Staemme am Rand rechts
          direction = -1                                        #von rechts nach links
        elsif x < 0                                             #abprallen Stamm am Rand links
          direction = 1                                         #von links nach rechts
        end                                                     #Ende Fallentscheidung
        x = x + speed * direction                               # Bewegungsrichtung - aktuelle y-Position der Baumstaemme berechnen
        baum.move(x,y)                                          #Baum bewegt sich
      end
    end
  Hier noch eine Änderung Olga.. Grüße, Steffi                                      #Ende der Funktion def baumstamm(x,y)

  baumstamm(-250,80)                                            #Startpunkt (Ausgehend oben,links) der Baumstaemme außerhalb des Fensters
  baumstamm(800,120)
  baumstamm(-250,160)
  baumstamm(800,200)

    Frogger Frogg frogg frogger Frogg

  x1= 400                                                       #Variable x1 das Rechtecks; Position vom linken Punkt ausgehend
  y1= 440                                                       #Variable y1 das Rechtecks; Position vom oberern Punkt ausgehend

  frosch_oben = image "frogger_spielfigur_up.png", width: 40, height: 40
  frosch_links = image "frogger_spielfigur_left.png", width: 40, height: 40
  frosch_rechts = image "frogger_spielfigur_right.png", width: 40, height: 40
  frosch_unten = image "frogger_spielfigur_down.png", width: 40, height: 40
  frosch_oben.move(400,440)                                     #Damit der Frosch am Anfang an schon da sitzt




    keypress do |Hallo Olga, das ist eine Änderung... Sorry für den Konflikt!

      kielen Dank liebe Stefanie für den Konf...
    endkkk

      Doch Doch!

    ZWE
jb lhzugogzugil                                    #Arrow_tastatur oben
        frosch_oben.show.move(x1, y1 - 40)                      #Bei Tastendruck Bewegung um 40 Pixel nach oben
        y1 -= 40                                                #jeder weitere Tastendruck bewegt das Rechteck um 40 Pixel weiter nach oben



# Klasse Schwimmobjekt

class Schwimmobjekt

  def initiammmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    mmmmkjjioj
  end
