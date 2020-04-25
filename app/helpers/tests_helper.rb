module TestsHelper
    def test_header(test)

    header_part = test.new_record? ?
    "Create new" :
    "Edit"

    "#{header_part} test"
  end

  TEST_LEVELS = { 0 => :easy, 1 => :elementaty, 2 => :advanced, 3 => :hard}

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

end
