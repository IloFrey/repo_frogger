#Froggerspiel
Shoes.app width: 800, height: 480 do                            #groeße der Speilfeldflaeche

  image "Frogger_Hintergrund_Gimp-2.png",width: 800, height: 480    #Bild als Spielfeldflaeche

  #Funktion:  Baumstaemme bewegen sich unterschiedlich hin und her
  def baumstamm(x,y)                                            #Funktion fuer Baumstamm mit uebergabeparameter x,y, um spaeter nur noch die Startpunk x,y der einzelnen Baumstaemme angeben zu muessen.

    speed = 1                                                 #Variable die spaeter hilft, dass der Baumstamm  sich immer um 1 Pixel weiter bewegt
 ja schon wieder was verändert                                             #Initialisierungswert - Ich bestimme die Anfangsrichtung

    frosch_oben = image "frogger_spielfigur_up.png", width: 40, height: 40
    frosch_links = image "frogger_spielfigur_left.png", width: 40, height: 40
    frosch_rechts = image "frogger_spielfigur_right.png", width: 40, height: 40
    frosch_unten = image "frogger_spielfigur_down.png", width: 40, height: 40
    frosch_oben.move(400,440)

    Frogger Frogg frogg frogger Frogg

  x1= 400                                                       #Variable x1 das Rechtecks; Position vom linken Punkt ausgehend
  y1= 440                                                       #Variable y1 das Rechtecks; Position vom oberern Punkt ausgehend

  frosch_oben = image "frogger_spielfigur_up.png", width: 40, height: 40
  frosch_links = image "frogger_spielfigur_left.png", width: 40, height: 40
  frosch_rechts = image "frogger_spielfigur_right.png", width: 40, height: 40
  frosch_unten = image "frogger_spielfigur_down.png", width: 40, height: 40
  frosch_oben.move(400,440)                                     #Damit der Frosch am Anfang an schon da sitzt




    keypress do |Hallo Olga, das ist eine Änderung... Sorry für den Konflikt!

      Vielen Dank liebe Stefanie für den Konflikt! Habe mich sehr drüber gefreut!#Tastaturen_Block
    end

      Neeeeeeee

    ZWEITER VERSUCH!!!!

      elsif k==:up                                              #Arrow_tastatur oben
        frosch_oben.show.move(x1, y1 - 40)                      #Bei Tastendruck Bewegung um 40 Pixel nach oben
        y1 -= 40                                                #jeder weitere Tastendruck bewegt das Rechteck um 40 Pixel weiter nach oben



# Klasse Schwimmobjekt

class Schwimmobjekt

  def initialize(app,x,y,geschwindigkeit)
    @app = app
    @x_position = x
    @y_position = y
    @geschwindigkeit = geschwindigkeit
    @direction = 1
    @breite = 200
    @hoehe = 56

    @image = @app.image "Baumstamm.jpg",width: 750, height:200
  end



        DIES IST EINE ÄNDERUNG DURCH STEFASHKA


MEINE ÄNDERUNG

  Ich (olga) ändere jetzt hier was
