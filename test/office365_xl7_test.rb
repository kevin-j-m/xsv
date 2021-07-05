require './test/test_helper'

class Office365Xl7Test < Minitest::Test
  def setup
    @file = Xsv::Workbook.open('test/files/office365-xl7.xlsx')
  end

  def test_sheet_order
    assert_equal 'the', @file.sheets[0][0][0]
    assert_equal 'slighly', @file.sheets[1][0][0] # (sic)
    assert_equal 'Percentage', @file.sheets[2][0][0]
  end

  def test_column_count
    assert_equal 2, @file.sheets[0][0].count
    assert_equal 3, @file.sheets[1][0].count
    assert_equal 5, @file.sheets[2][0].count
  end

  def test_sheet1
    assert_equal ['slighly', nil, 'odd'], @file.sheets[1][0]
    assert_equal [nil, nil, nil], @file.sheets[1][1]
    assert_equal ['little', nil, 'sheet'], @file.sheets[1][2]
  end

  def test_sheet2
    sheet2 = @file.sheets[2]
    sheet2.parse_headers!

    assert_equal 0.25, sheet2[0]['Percentage']
    assert_equal 0.25, sheet2[0]['Calculated percentage']
  end

  def test_datetime
    sheet2 = @file.sheets[2]
    sheet2.parse_headers!
    assert_equal Time.new(2020, 2, 20, 13, 20), sheet2[0]['Date w/ time']
  end

  def test_boolean
    sheet2 = @file.sheets[2]
    sheet2.parse_headers!
    assert_equal true, sheet2[0]['Boolean']
    assert_equal false, sheet2[1]['Boolean']
  end

  def test_unparsed_headers
    sheet2 = @file.sheets[2]

    assert_equal ['Percentage', 'Calculated percentage', 'Date w/ time', 'Date', 'Boolean'], sheet2.headers
  end

  def test_parsed_headers
    sheet2 = @file.sheets[2]

    sheet2.parse_headers!

    assert_equal ['Percentage', 'Calculated percentage', 'Date w/ time', 'Date', 'Boolean'], sheet2.headers
  end
end
