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
  end                                                           #Ende der Funktion def baumstamm(x,y)

  baumstamm(-250,80)                                            #Startpunkt (Ausgehend oben,links) der Baumstaemme außerhalb des Fensters
  baumstamm(800,120)
  baumstamm(-250,160)
  baumstamm(800,200)

  x1= 400                                                       #Variable x1 das Rechtecks; Position vom linken Punkt ausgehend
  y1= 440                                                       #Variable y1 das Rechtecks; Position vom oberern Punkt ausgehend

  frosch_oben = image "frogger_spielfigur_up.png", width: 40, height: 40
  frosch_links = image "frogger_spielfigur_left.png", width: 40, height: 40
  frosch_rechts = image "frogger_spielfigur_right.png", width: 40, height: 40
  frosch_unten = image "frogger_spielfigur_down.png", width: 40, height: 40
  frosch_oben.move(400,440)                                     #Damit der Frosch am Anfang an schon da sitzt




    keypress do |k|                                             #Tastaturen_Block

      if k==:down                                               #Fallentscheidung zur Definition der 4 Richtungen des Rechtecks; Arrow_tastatur nach unten
        frosch_unten.show.move(x1, y1 + 40)                     #Bei Tastendruck Bewegung um 40 Pixel nach unten
        y1 += 40                                                #jeder weitere Tastendruck bewegt das Rechteck um 40 Pixel weiter nach unten
        frosch_links.hide
        frosch_rechts.hide
        frosch_oben.hide

      elsif k==:up                                              #Arrow_tastatur oben
        frosch_oben.show.move(x1, y1 - 40)                      #Bei Tastendruck Bewegung um 40 Pixel nach oben
        y1 -= 40                                                #jeder weitere Tastendruck bewegt das Rechteck um 40 Pixel weiter nach oben
        frosch_links.hide
        frosch_rechts.hide
        frosch_unten.hide

      elsif k==:right                                           #Arrow_tastatur rechts
        frosch_rechts.show.move(x1 + 40, y1)                    #Bei Tastendruck Bewegung um 40 Pixel nach rechts
        x1 += 40                                                #jeder weitere Tastendruck bewegt das Rechteck um 40 Pixel weiter nach rechts
        frosch_links.hide
        frosch_oben.hide
        frosch_unten.hide

      elsif k==:left                                            #Arrow_tastatur links
        frosch_links.show.move(x1 - 40, y1)                              #Bei Tastaturdruck Bewegung um 40 Pixel nach links
        x1 -= 40                                                #jeder weitere Tastaturdruck bewegt das Rechteck um 40 Pixel weiter nach links
        frosch_rechts.hide
        frosch_oben.hide
        frosch_unten.hide

      end                                                       #Fallentscheidung ende
                                                            #Tastaturblock ende
   end
end

#Klasse Frosch

class Frosch

  def initialize(app, start_x, start_y, sprung, anzahl_leben)
    #speichere die referenz zu dem Shoes Objekt um auf deren Methoden zuzugreifen
    @app = app
    #position initialisieren
    @x_position = start_x
    @y_position = start_y
    #sprungweite initialisieren
    @sprung = sprung
    #anfangsposition initialisieren damit der Frosch bei Lebenverlust zurückgesetzt wird
    @start_position_x = start_x
    @start_position_y = start_y
    #sichere Anzahl der Leben
    @leben = anzahl_leben
    #Bild dem Objekt zuweisen
    @image = @app.image "frogger_spielfigur_up.png", width: RASTER, height: RASTER
    #Der Frosch erscheint auf dieser Position
    @image.move(@x_position, @y_position)
  end

  #Diese Methode soll aufgerufen werden, wenn der Frosch sein leben verliert
  def leben_verloren(animation)
    @leben -= 1
    if(@leben <= 0)
      @app.alert "Game Over"
      animation.stop
    else
      @x_position = @start_position_x
      @y_position = @start_position_y
      @image.move(@x_position, @y_position)
    end
  end

  #Mit dieser Methode kann die Sprungweite von Frosch geändert werden
  def set_sprung(sprung)
    @sprung = sprung
  end

  #Diese Methode soll Tastedruckevent anlegen (wie Animation). Je nach Tastendruck wird hier definiert was mit dem
  #Frosch passieren soll
  def start
    @app.keypress do |k|
      if k ==:down and @y_position <= BEGRENZUNG_UNTEN
        @y_position +=  @sprung
        @image.path = "frogger_spielfigur_down.png"
      elsif k ==:up and @y_position >= BEGRENZUNG_OBEN
        @y_position -=  @sprung
        @image.path = "frogger_spielfigur_up.png"
      elsif k ==:right and @x_position <= BEGRENZUNG_RECHTS
        @x_position += @sprung
        @image.path = "frogger_spielfigur_right.png"
      elsif k ==:left and @x_position >= BEGRENZUNG_LINKS
        @x_position -= @sprung
        @image.path = "frogger_spielfigur_left.png"
      end
      #bewege den frosch
      @image.move(@x_position, @y_position)
      #sind wir am Ziel?
      if @y_position <= BEGRENZUNG_OBEN
        alert "Gewonnen!!!!"
      end
    end
  end

  #liefert die aktuellste x position zurück
  def get_x
    return @x_position
  end

  #liefert die aktuellste y position zurück
  def get_y
    return @y_position
  end

  #Bewegt den Frosch auf die bestimmte Position (z.B. Baumstamm)
  def bewegen(x, y)
    @x_position = x
    @y_position = y
    @image.move(@x_position, @y_position)
  end
end




