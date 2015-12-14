require "./application"
class BusinessIntelligence
    attr_reader :applications
    def initialize
        @applications = []

    end

    def find_by_title(title)
        results = []
        search = title.downcase
        applications.each do |application|
            if application.title.downcase.include?(search)
                results.push(application)
            end
        end
        print_results(search, results)

    end

    def find_by_description(description)
        results = []
        search = description.downcase
        applications.each do |application|
            if application.description.downcase.include?(search)
                results.push(application)
            end
        end
        print_results(search, results)
    end

    def print_results(search, results)
        puts "Application search results (#{search})"
        puts "--------------------------"
        results.each do |application|
                puts application.to_s('full')
                application.print_targetdevices
                application.print_components
                puts "\n"
        end
    end

    def print_applications
        applications.each do |application|
            puts application.to_s('full')
            puts application.print_targetdevices
            puts application.print_components
        end
    end
end


businessintelligence = BusinessIntelligence.new
# firstApp data
firstApp = Application.new
firstApp.title = "FirstApp"
firstApp.description = "Web application"
firstApp.version = "1.0"
firstApp.add_targetdevice("Chrome", "Google's Web Brower")
firstApp.add_targetdevice("Firefox", "Firefox Web Brower")
firstApp.add_component("GAE", "Java", "Google")
businessintelligence.applications.push(firstApp)
# secondApp data
secondApp = Application.new
secondApp.title = "SecondApp"
secondApp.description = "Game for TV"
secondApp.version = "2.0"
secondApp.add_targetdevice("Apple TV", "Apple's 3rd generation Apple TV")
secondApp.add_component("AWS", "Python", "Amazon" )
businessintelligence.applications.push(secondApp)
puts "--------------------------"
# businessintelligence.print_applications
# businessintelligence.find_by_title("second")
businessintelligence.find_by_description("game")
puts "--------------------------"
