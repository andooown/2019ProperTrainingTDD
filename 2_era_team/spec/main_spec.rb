require 'minitest/autorun'
require "stringio"
require_relative '../lib/era.rb'

class MainTest < Minitest::Test
    def test_main()
        input, result = TestSets.default_set

        inputio = StringIO.new(input, 'r+')
        outputio = StringIO.new("", 'w+')

        EraParser.main(inputio, outputio)

        assert_equal result, outputio.string
    end
    
    def test_return_error_newline_only()
        i, o = TestSets.newline_only_set

        inputio = StringIO.new(i, 'r+')
        outputio = StringIO.new("", 'w+')

        EraParser.main(inputio, outputio)

        assert_equal o, outputio.string
    end
    
    def test_unparsable()
        i, o = TestSets.unparsable_set

        inputio = StringIO.new(i, 'r+')
        outputio = StringIO.new("", 'w+')

        EraParser.main(inputio, outputio)

        assert_equal o, outputio.string
    end



    private 
    module TestSets
        module_function

        def default_set
            input = <<~EOF
            1989/1/7
            1900/1/1

            1989/1/8
            EOF

            result = <<~EOF
            昭和64年
            error
            error
            平成元年
            EOF

            return input, result
        end

        def newline_only_set
            i = <<~EOF
    
            EOF
    
            o = <<~EOF
            error
            EOF
    
            return i, o        
        end
        
        def unparsable_set
            i = <<~EOF
            100/2/2
            10000/2/2
            199-19-19
            EOF
    
            o = <<~EOF
            error
            error
            error
            EOF
    
            return i, o        
        end
    end
end