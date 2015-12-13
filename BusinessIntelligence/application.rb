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


end


firstApp = Application.new
firstApp.title = "First App"
firstApp.description = "Web application"
firstApp.version = "1.0"
puts firstApp.title + ":" + firstApp.description
