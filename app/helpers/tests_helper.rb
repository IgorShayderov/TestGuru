module TestsHelper
    def test_header(test)

    header_part = test.new_record? ?
    "Create new" :
    "Edit"

    "#{header_part} test"
  end
end
