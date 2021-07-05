require './test/test_helper'

# Test for miscellaneous files found in the wild

class MiscTest < Minitest::Test
  def test_complex_number
    @file = Xsv::Workbook.open('test/files/complex.xlsx')

    row = @file.sheets[0][1]

    assert_equal 0.001, row[1]
    assert_equal 0.01, row[2]
    assert_equal 0.1, row[3]
  end

  def test_nil_number_format
    @file = Xsv::Workbook.open('test/files/caxlsx.xlsx')

    row = @file.sheets[0][0]

    assert_equal [1], row
  end

  def test_iso8601
    @file = Xsv::Workbook.open('test/files/iso8601.xlsx')

    date = @file.sheets[0][1][13]

    assert_kind_of DateTime, date
    assert_equal DateTime.new(2021, 7, 1, 5, 11, 26).to_s, date.to_s
  end
end
