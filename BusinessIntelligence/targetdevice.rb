class TargetDevice
        attr_accessor :title, :description, :version


        def to_s
            "#{title}: #{description}"
        end


end
