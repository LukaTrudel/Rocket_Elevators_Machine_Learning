module ElevatorMedia
    class Streamer
        require 'quotify'
        def self.test
            0
        end

        def self.format(data)
            "<div> #{data} </div>"
        end
        # returns different content depending on which argument we pass in
        def self.getContent(data)
            return format(meow()) if data == "meow"
            return format(youtube()) if data == "youtube"
            return format(quote()) if data == "quote"
        end
        
        # meow api
        def self.meow
            "https://meowfacts.herokuapp.com/"
        end
        
        def self.youtube
            "<iframe width=100% height=100% src=https://www.youtube.com/watch?v=MWGHbTqY5FE scrolling=no></iframe>"
        end
        
        def self.quote
            Quotify.generate
        end
    end
end
    