class MyCustomError < StandardError
    def initialize(msg = nil)
        #super(msg)
        @error = msg
    end
end