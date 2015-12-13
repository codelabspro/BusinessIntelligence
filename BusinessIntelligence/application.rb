class Application
    attr_writer :title, :description, :version

    def title
        @title
    end

    def description
        @description
    end

    def version
        @version
    end

    def to_s
        to_string = "#{title} #{description} #{version}"
        to_string
    end

end


firstApp = Application.new
firstApp.title = "First App"
firstApp.description = "Web application"
firstApp.version = "1.0"
firstApp.add_targetdevice("Chrome", "Google's Web Brower")
puts firstApp.to_s

secondApp = Application.new
secondApp.title = "Second App"
secondApp.description = "Game for TV"
secondApp.version = "2.0"
secondApp.add_targetdevice("Apple TV", "Apple's 3rd generation Apple TV")
puts secondApp.to_s
