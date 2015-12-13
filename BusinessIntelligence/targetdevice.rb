class TargetDevice
        attr_accessor :title, :description, :version
        attr_reader :targetdevices

        def initialize
            @targetdevices = []
        end

        def add_targetdevice(title, description)
            targetdevice = TargetDevice.new
            targetdevice.title = title
            targetdevice.description = description
            targetdevices.push(targetdevice)
        end


        def title

        end

        def to_s
            "#{{title}}: #{description}"
        end


end
