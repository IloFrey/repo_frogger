BREITE = 400
HOEHE = 880
BEGRENZUNG_UNTEN    = HOEHE - 80
BEGRENZUNG_OBEN     = 0 + 40
BEGRENZUNG_RECHTS   = BREITE - 80
BEGRENZUNG_LIMKS    = 0 + 40


Shoes.app width: BREITE, height: HOEHE do

  class Frosch
    def initialize(image, x, y, step)
      @image = image
      @x_position = x
      @y_position = y
      @step = step
      @image.move(@x_position, @y_position) #Damit der Frosch am Anfang an schon da sitzt
    end

    def get_x
      return @x_position
    end

    def get_y
      return @y_position
    end

    def setStep(step)
      @step = step
    end

    def move(direction)
      if direction ==:down and @y_position <= Limit_Bottom
        @y_position +=  @step
        @image.path = "frogger_spielfigur_down.png"
      elsif direction ==:up and @y_position >= Limit_Top
        @y_position -=  @step
        @image.path = "frogger_spielfigur_up.png"
      elsif direction ==:right and @x_position <= Limit_Right
        @x_position += @step
        @image.path = "frogger_spielfigur_right.png"
      elsif direction ==:left and @x_position >= Limit_Left
        @x_position -= @step
        @image.path = "frogger_spielfigur_left.png"
      end

      @image.move(@x_position, @y_position)
    end
  end

#Hauptprogramm
  image = image "frogger_spielfigur_up.png", width: 40, height: 40
  image2 = image "frogger_spielfigur_up.png", width: 80, height: 80
  frosch = Frosch.new(image, 400,440, 40)
  frosch2 = Frosch.new(image2, 200, 200, 10)

  #frosch_oben.move(frosch.get_x, frosch.get_y) #Damit der Frosch am Anfang an schon da sitzt

  keypress do |k|
    frosch.move(k)
    frosch2.move(k)
    #frosch_oben.show.move(frosch.get_x, frosch.get_y)
  end
  #frosch.movement

end