#kommen
RASTER = 40
FENSTER_BREITE= 20 * RASTER #800
FENSTER_HOEHE = 12 * RASTER #480
BEGRENZUNG_OBEN = 0 + RASTER #40
BEGRENZUNG_UNTEN    = FENSTER_HOEHE - RASTER #440
BEGRENZUNG_RECHTS   = FENSTER_BREITE - (2*RASTER)
BEGRENZUNG_LINKS   = 0 + RASTER
#kommentar
Shoes.app width: FENSTER_BREITE, height: FENSTER_HOEHE do

  image "Frogger_Hintergrund_Gimp2.png",width: FENSTER_BREITE, height: FENSTER_HOEHE

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

# Klasse Schwimmobjekt

  class Schwimmobjekt

    def initialize(app,x,y,geschwindigkeit)
      @app = app
      @x_position = x
      @y_position = y
      @geschwindigkeit = geschwindigkeit
      @direction = 1
      @breite = 200
      @hoehe = 30

      @image = @app.image "Baumstamm.jpg",width: @breite, height:@hoehe
    end

    #starte den Prozess vom Objekt (fängt etwas zu tun an)
    #Übergabeparameter wird benötigt um auf andere vorhandene Objekte zuzugreifen
    def start(spielobjekt)
      @spielobjekt = spielobjekt
      zufallszahl = rand(5)
      @app.timer(zufallszahl) do
        animation = @app.animate (60) do |i|
          if @x_position > 600
            @direction = -1
          elsif @x_position < 0 then
            @direction = 1
          end


        end
      end
    end

  end

  #Klasse Fahrzeug

  class Fahrzeug

    def initialize(app, pfad, breite, hoehe, x, y, , direction, koll_object )
      @app = app
      @x_position = x
      @y_position = y
      @geschwindigkeit = geschwindigkeit
      @direction = direction
      @kollisionsobjekt = koll_object
      @startposition = x
      @image = @app.image pfad, width:breite, height:hoehe
    end

    def bewegung

      @app.timer(rand(3)) do
        animation = @app.animate (60) do
          if @x_position > 700 or @x_position < 40
            @x_position = @startposition
          else
            @x_position = @x_position + @geschwindigkeit * @direction
            @image.move(@x_position,@y_position)
            if(@x_position == @kollisionsobjekt.get_x) and (@y_position == @kollisionsobjekt.get_y)
              @kollisionsobjekt.leben_verloren(animation)  #leben verloren
            end
          end

        end
      end
    end


    def rechte_ecke
      return @x_position
    end

    def get_y
      return @y_position
    end


  end


  #Hauptprogramm

  #Erstellen der Baumstämme
  baumstamm1 = Schwimmobjekt.new(self,800,120,1)
  baumstamm2 = Schwimmobjekt.new(self,800,200,1)
  baumstamm3 = Schwimmobjekt.new(self,-250,80,1)
  baumstamm4 = Schwimmobjekt.new(self,-250,160,1)

#Erstellen des Frosches
  frosch = Frosch.new(self, FENSTER_BREITE/2, 440, RASTER, 3)

  #starte die Bausmtammanimation und übergebe das objekt frosch als Referenz
  baumstamm1.start(frosch)
  baumstamm2.start(frosch)
  baumstamm3.start(frosch)
  baumstamm4.start(frosch)

  #starte die Froschanimation
  frosch.start

#Erstellen des Autos

  auto = Fahrzeug.new(self, "Frogger_Auto_gelb.png",60,30,700,280,2, -1, frosch)
  auto6 = Fahrzeug.new(self, "Frogger_Auto_gelb.png",60,30,700,280,2, -1, frosch)
  auto2 = Fahrzeug.new(self,"Frogger_Auto_Hellblau.png",60,30,60,320,4, 1, frosch)
  auto3 = Fahrzeug.new(self, "Frogger_Auto_gelb.png",60,30,700,360,3, -1, frosch)
  auto4 = Fahrzeug.new(self, "Frogger_Auto_Hellblau.png",60,30,60,400,1, 1, frosch)
  auto5 = Fahrzeug.new(self, "Frogger_Auto_Hellblau.png",60,30,60,400,1, 1, frosch)

  #starte die Autobewegung
  auto.bewegung
  auto2.bewegung
  auto3.bewegung
  auto4.bewegung
  auto5.bewegung
  auto6.bewegung

end

#Erstellen des Autos

auto = Fahrzeug.new(self, "Frogger_Auto_gelb.png",60,30,700,280,2, -1, frosch)
auto6 = Fahrzeug.new(self, "Frogger_Auto_gelb.png",60,30,700,280,2, -1, frosch)
auto2 = Fahrzeug.new(self,"Frogger_Auto_Hellblau.png",60,30,60,320,4, 1, frosch)
auto3 = Fahrzeug.new(self, "Frogger_Auto_gelb.png",60,30,700,360,3, -1, frosch)
auto4 = Fahrzeug.new(self, "Frogger_Auto_Hellblau.png",60,30,60,400,1, 1, frosch)
auto5 = Fahrzeug.new(self, "Frogger_Auto_Hellblau.png",60,30,60,400,1, 1, frosch)

#starte die Autobewegung
auto.bewegung
auto2.bewegung
auto3.bewegung
auto4.bewegung


end

Ich schreibe jetz was hier rein, damit der Konflikt endlich klappt!


