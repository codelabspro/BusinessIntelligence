require "./application"
class BusinessIntelligence
    attr_reader :applications
    def initialize
        @applications = []

    end

    def print_applications
        applications.each do |application|
            puts application.to_s('full')
        end
    end
end


businessintelligence = BusinessIntelligence.new
puts "--------------------------"
firstApp = Application.new
firstApp.title = "First App"
firstApp.description = "Web application"
firstApp.version = "1.0"
firstApp.add_targetdevice("Chrome", "Google's Web Brower")
firstApp.add_targetdevice("Firefox", "Firefox Web Brower")
firstApp.add_component("GAE", "Java", "Google")
businessintelligence.applications.push(firstApp)
puts "--------------------------"
secondApp = Application.new
secondApp.title = "Second App"
secondApp.description = "Game for TV"
secondApp.version = "2.0"
secondApp.add_targetdevice("Apple TV", "Apple's 3rd generation Apple TV")
secondApp.add_component("AWS", "Python", "Amazon" )
businessintelligence.applications.push(secondApp)
puts "--------------------------"
businessintelligence.print_applications
puts "--------------------------"
