# frozen_string_literal: true
module Xsv
  # SheetBoundsHandler scans a sheet looking for the outer bounds of the content within.
  # This is used internally when opening a sheet to deal with worksheets that do not
  # have a correct dimension tag.
  class SheetBoundsHandler < Nokogiri::XML::SAX::Document
    include Xsv::Helpers

    def self.get_bounds(sheet, workbook)
      rows = 0
      cols = 0

      handler = new(workbook.trim_empty_rows) do |row, col|
        rows = row
        cols = col == 0 ? 0 : col + 1

        return rows, cols
      end

      sheet.rewind

      Nokogiri::XML::SAX::Parser.new(handler).parse(sheet)

      return rows, cols
    end

    def initialize(trim_empty_rows, &block)
      @block = block
      @state = nil
      @cell = nil
      @row = nil
      @maxRow = 0
      @maxColumn = 0
      @trim_empty_rows = trim_empty_rows
    end

    def start_element(name, attrs)
      case name
      when "c"
        @state = name
        @cell = attrs.to_h["r"]
      when "v"
        col = column_index(@cell)
        @maxColumn = col if col > @maxColumn
        @maxRow = @row if @row > @maxRow
      when "row"
        @state = name
        @row = attrs.to_h["r"].to_i
      when "dimension"
        @state = name

        _firstCell, lastCell = attrs.to_h["ref"].split(":")

        if lastCell
          @maxColumn = column_index(lastCell)
          unless @trim_empty_rows
            @maxRow = lastCell[/\d+$/].to_i
            @block.call(@maxRow, @maxColumn)
          end
        end
      end
    end

    def end_element(name)
      if name == "sheetData"
        @block.call(@maxRow, @maxColumn)
      end
    end
  end
end
